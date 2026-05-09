; DESCRIPTION: Draws a white line from (288, 50) to (474, 0).
; PLAN: r0=288(x1), r1=50(y1), r2=474(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 50
LDI r2, 474
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
