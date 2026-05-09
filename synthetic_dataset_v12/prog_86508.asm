; DESCRIPTION: Draws a white line from (424, 26) to (404, 48).
; PLAN: r0=424(x1), r1=26(y1), r2=404(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 26
LDI r2, 404
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
