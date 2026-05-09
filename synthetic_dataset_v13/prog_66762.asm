; DESCRIPTION: Places a blue line segment connecting (82, 25) to (328, 36).
; PLAN: r0=82(x1), r1=25(y1), r2=328(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 25
LDI r2, 328
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
