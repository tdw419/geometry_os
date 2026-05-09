; DESCRIPTION: Places a green line segment connecting (61, 146) to (485, 2).
; PLAN: r0=61(x1), r1=146(y1), r2=485(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 146
LDI r2, 485
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
