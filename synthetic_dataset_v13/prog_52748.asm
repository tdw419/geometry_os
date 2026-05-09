; DESCRIPTION: Composite: Places a red circle of radius 56 at center (185, 94) then Draws a white rectangle at (401, 8) with width 44 and height 38 then Places a cyan dot at position (32, 166).
; PLAN: r0=185(x), r1=94(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=401(x), r6=8(y), r7=44(width), r8=38(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=32(x), r11=166(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 185
LDI r1, 94
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 401
LDI r6, 8
LDI r7, 44
LDI r8, 38
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 32
LDI r11, 166
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
