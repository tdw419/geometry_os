; DESCRIPTION: Renders a green line between points (459, 213) and (27, 138).
; PLAN: r0=459(x1), r1=213(y1), r2=27(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 213
LDI r2, 27
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
