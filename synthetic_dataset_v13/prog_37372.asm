; DESCRIPTION: Places a blue line segment connecting (50, 37) to (82, 223).
; PLAN: r0=50(x1), r1=37(y1), r2=82(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 37
LDI r2, 82
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
