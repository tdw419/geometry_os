; DESCRIPTION: Places a red line segment connecting (492, 54) to (307, 189).
; PLAN: r0=492(x1), r1=54(y1), r2=307(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 54
LDI r2, 307
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
