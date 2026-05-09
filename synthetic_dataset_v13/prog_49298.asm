; DESCRIPTION: Draws a green line from (15, 71) to (281, 15).
; PLAN: r0=15(x1), r1=71(y1), r2=281(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 71
LDI r2, 281
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
