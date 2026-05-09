; DESCRIPTION: Draws a yellow line from (125, 83) to (27, 126).
; PLAN: r0=125(x1), r1=83(y1), r2=27(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 83
LDI r2, 27
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
