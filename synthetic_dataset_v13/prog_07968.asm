; DESCRIPTION: Draws a white line from (361, 23) to (434, 8).
; PLAN: r0=361(x1), r1=23(y1), r2=434(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 23
LDI r2, 434
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
