; DESCRIPTION: Draws a yellow line from (245, 35) to (380, 120).
; PLAN: r0=245(x1), r1=35(y1), r2=380(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 35
LDI r2, 380
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
