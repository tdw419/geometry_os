; DESCRIPTION: Renders a green line between points (196, 213) and (408, 124).
; PLAN: r0=196(x1), r1=213(y1), r2=408(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 213
LDI r2, 408
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
