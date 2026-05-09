; DESCRIPTION: Places a blue line segment connecting (446, 39) to (352, 34).
; PLAN: r0=446(x1), r1=39(y1), r2=352(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 39
LDI r2, 352
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
