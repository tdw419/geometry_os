; DESCRIPTION: Places a blue line segment connecting (174, 45) to (401, 16).
; PLAN: r0=174(x1), r1=45(y1), r2=401(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 45
LDI r2, 401
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
