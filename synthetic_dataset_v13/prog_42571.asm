; DESCRIPTION: Draws a white line from (57, 16) to (282, 214).
; PLAN: r0=57(x1), r1=16(y1), r2=282(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 16
LDI r2, 282
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
