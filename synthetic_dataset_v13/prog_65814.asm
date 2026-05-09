; DESCRIPTION: Composite: Places a white circle of radius 29 at center (393, 66) then Renders a yellow box of size 44x21 starting at (342, 195) then Places a magenta dot at position (479, 120).
; PLAN: r0=393(x), r1=66(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x), r6=195(y), r7=44(width), r8=21(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=479(x), r11=120(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 393
LDI r1, 66
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 195
LDI r7, 44
LDI r8, 21
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 120
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
