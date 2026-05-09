; DESCRIPTION: Draws a black line from (281, 14) to (286, 209).
; PLAN: r0=281(x1), r1=14(y1), r2=286(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 14
LDI r2, 286
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
