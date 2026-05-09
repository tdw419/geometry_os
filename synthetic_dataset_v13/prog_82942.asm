; DESCRIPTION: Renders a white line between points (72, 60) and (276, 234).
; PLAN: r0=72(x1), r1=60(y1), r2=276(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 60
LDI r2, 276
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
