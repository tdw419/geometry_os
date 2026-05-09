; DESCRIPTION: Places a white line segment connecting (1, 56) to (404, 113).
; PLAN: r0=1(x1), r1=56(y1), r2=404(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 56
LDI r2, 404
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
