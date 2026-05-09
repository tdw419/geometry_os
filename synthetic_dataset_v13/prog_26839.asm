; DESCRIPTION: Draws a yellow line from (184, 27) to (89, 243).
; PLAN: r0=184(x1), r1=27(y1), r2=89(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 27
LDI r2, 89
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
