; DESCRIPTION: Places a orange line segment connecting (354, 215) to (404, 110).
; PLAN: r0=354(x1), r1=215(y1), r2=404(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 215
LDI r2, 404
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
