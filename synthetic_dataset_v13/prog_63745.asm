; DESCRIPTION: Draws a white line from (340, 196) to (24, 201).
; PLAN: r0=340(x1), r1=196(y1), r2=24(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 196
LDI r2, 24
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
