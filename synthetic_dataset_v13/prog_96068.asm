; DESCRIPTION: Draws a black line from (281, 199) to (265, 182).
; PLAN: r0=281(x1), r1=199(y1), r2=265(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 199
LDI r2, 265
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
