; DESCRIPTION: Places a yellow line segment connecting (404, 73) to (135, 18).
; PLAN: r0=404(x1), r1=73(y1), r2=135(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 73
LDI r2, 135
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
