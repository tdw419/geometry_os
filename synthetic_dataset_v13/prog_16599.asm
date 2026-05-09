; DESCRIPTION: Draws a black line from (16, 196) to (510, 116).
; PLAN: r0=16(x1), r1=196(y1), r2=510(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 196
LDI r2, 510
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
