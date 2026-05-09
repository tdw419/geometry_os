; DESCRIPTION: Draws a white line from (402, 88) to (197, 132).
; PLAN: r0=402(x1), r1=88(y1), r2=197(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 88
LDI r2, 197
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
