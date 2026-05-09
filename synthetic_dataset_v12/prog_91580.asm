; DESCRIPTION: Renders a yellow line between points (63, 8) and (196, 242).
; PLAN: r0=63(x1), r1=8(y1), r2=196(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 8
LDI r2, 196
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
