; DESCRIPTION: Places a blue line segment connecting (187, 205) to (252, 243).
; PLAN: r0=187(x1), r1=205(y1), r2=252(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 205
LDI r2, 252
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
