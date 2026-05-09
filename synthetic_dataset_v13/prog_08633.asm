; DESCRIPTION: Places a white line segment connecting (81, 214) to (173, 207).
; PLAN: r0=81(x1), r1=214(y1), r2=173(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 214
LDI r2, 173
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
