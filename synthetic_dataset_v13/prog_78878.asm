; DESCRIPTION: Places a black line segment connecting (263, 98) to (404, 36).
; PLAN: r0=263(x1), r1=98(y1), r2=404(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 98
LDI r2, 404
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
