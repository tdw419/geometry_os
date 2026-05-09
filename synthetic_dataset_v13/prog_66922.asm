; DESCRIPTION: Renders a green line between points (213, 12) and (262, 144).
; PLAN: r0=213(x1), r1=12(y1), r2=262(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 12
LDI r2, 262
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
