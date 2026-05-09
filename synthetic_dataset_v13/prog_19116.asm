; DESCRIPTION: Places a green line segment connecting (84, 5) to (404, 49).
; PLAN: r0=84(x1), r1=5(y1), r2=404(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 5
LDI r2, 404
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
