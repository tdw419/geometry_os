; DESCRIPTION: Draws a white line from (254, 120) to (101, 64).
; PLAN: r0=254(x1), r1=120(y1), r2=101(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 120
LDI r2, 101
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
