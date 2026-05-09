; DESCRIPTION: Draws a yellow line from (46, 21) to (210, 93).
; PLAN: r0=46(x1), r1=21(y1), r2=210(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 21
LDI r2, 210
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
