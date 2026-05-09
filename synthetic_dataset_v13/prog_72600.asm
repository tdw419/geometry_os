; DESCRIPTION: Draws a black line from (502, 14) to (299, 207).
; PLAN: r0=502(x1), r1=14(y1), r2=299(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 14
LDI r2, 299
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
