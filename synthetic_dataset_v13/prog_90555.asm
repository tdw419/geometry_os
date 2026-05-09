; DESCRIPTION: Places a yellow line segment connecting (306, 210) to (373, 195).
; PLAN: r0=306(x1), r1=210(y1), r2=373(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 210
LDI r2, 373
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
