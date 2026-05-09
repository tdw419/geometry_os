; DESCRIPTION: Composite: Creates a yellow circular shape at (296, 149) with radius 70 then Renders a white box of size 94x61 starting at (260, 48) then Places a yellow dot at position (18, 38).
; PLAN: r0=296(x), r1=149(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x), r6=48(y), r7=94(width), r8=61(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=18(x), r11=38(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 296
LDI r1, 149
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 48
LDI r7, 94
LDI r8, 61
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 18
LDI r11, 38
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
