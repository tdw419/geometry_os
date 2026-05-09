; DESCRIPTION: Composite: Renders a cyan disk with center (362, 81) and radius 26 then Renders a green box of size 23x72 starting at (330, 85) then Sets a single red pixel at (99, 140).
; PLAN: r0=362(x), r1=81(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=330(x), r6=85(y), r7=23(width), r8=72(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=99(x), r11=140(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 362
LDI r1, 81
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 330
LDI r6, 85
LDI r7, 23
LDI r8, 72
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 140
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
