; DESCRIPTION: Composite: Renders a cyan disk with center (220, 96) and radius 75 then Renders a blue box of size 20x118 starting at (251, 128) then Places a magenta dot at position (14, 127).
; PLAN: r0=220(x), r1=96(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x), r6=128(y), r7=20(width), r8=118(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=14(x), r11=127(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 220
LDI r1, 96
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 128
LDI r7, 20
LDI r8, 118
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 14
LDI r11, 127
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
