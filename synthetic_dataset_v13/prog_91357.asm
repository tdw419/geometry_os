; DESCRIPTION: Composite: Places a red circle of radius 56 at center (364, 59) then Draws a purple line from (463, 161) to (425, 39) then Sets a single cyan pixel at (247, 134).
; PLAN: r0=364(x), r1=59(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=463(x1), r6=161(y1), r7=425(x2), r8=39(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=247(x), r11=134(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 364
LDI r1, 59
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 463
LDI r6, 161
LDI r7, 425
LDI r8, 39
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 134
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
