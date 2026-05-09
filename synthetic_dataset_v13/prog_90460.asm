; DESCRIPTION: Draws a white line from (4, 64) to (408, 32).
; PLAN: r0=4(x1), r1=64(y1), r2=408(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 64
LDI r2, 408
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
