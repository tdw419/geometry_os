; DESCRIPTION: Places a green line segment connecting (11, 20) to (420, 146).
; PLAN: r0=11(x1), r1=20(y1), r2=420(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 20
LDI r2, 420
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
