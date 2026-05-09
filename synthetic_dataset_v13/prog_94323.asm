; DESCRIPTION: Draws a white line from (86, 30) to (492, 172).
; PLAN: r0=86(x1), r1=30(y1), r2=492(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 30
LDI r2, 492
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
