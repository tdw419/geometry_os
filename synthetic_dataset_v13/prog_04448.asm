; DESCRIPTION: Draws a black line from (342, 30) to (290, 120).
; PLAN: r0=342(x1), r1=30(y1), r2=290(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 30
LDI r2, 290
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
