; DESCRIPTION: Draws a black line from (281, 80) to (172, 177).
; PLAN: r0=281(x1), r1=80(y1), r2=172(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 80
LDI r2, 172
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
