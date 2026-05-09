; DESCRIPTION: Places a blue line segment connecting (294, 210) to (292, 69).
; PLAN: r0=294(x1), r1=210(y1), r2=292(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 210
LDI r2, 292
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
