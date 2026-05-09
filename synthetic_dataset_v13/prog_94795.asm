; DESCRIPTION: Renders a yellow line between points (327, 237) and (408, 63).
; PLAN: r0=327(x1), r1=237(y1), r2=408(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 237
LDI r2, 408
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
