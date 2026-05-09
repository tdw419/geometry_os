; DESCRIPTION: Composite: Creates a red rectangular region at (290, 60) spanning 98 by 93 pixels then Sets a single orange pixel at (428, 51) then Places a green line segment connecting (192, 250) to (306, 192).
; PLAN: r0=290(x), r1=60(y), r2=98(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=428(x), r6=51(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=192(x1), r11=250(y1), r12=306(x2), r13=192(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 290
LDI r1, 60
LDI r2, 98
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 51
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 192
LDI r11, 250
LDI r12, 306
LDI r13, 192
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
