; DESCRIPTION: Places a orange line segment connecting (211, 172) to (502, 171).
; PLAN: r0=211(x1), r1=172(y1), r2=502(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 172
LDI r2, 502
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
