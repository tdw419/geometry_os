; DESCRIPTION: Composite: Creates a blue circular shape at (370, 75) with radius 71 then Renders a green box of size 51x24 starting at (393, 22) then Sets a single purple pixel at (156, 126).
; PLAN: r0=370(x), r1=75(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x), r6=22(y), r7=51(width), r8=24(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=156(x), r11=126(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 370
LDI r1, 75
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 22
LDI r7, 51
LDI r8, 24
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 126
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
