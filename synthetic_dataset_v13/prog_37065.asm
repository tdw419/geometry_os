; DESCRIPTION: Places a yellow line segment connecting (146, 205) to (292, 40).
; PLAN: r0=146(x1), r1=205(y1), r2=292(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 205
LDI r2, 292
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
