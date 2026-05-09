; DESCRIPTION: Renders a black line between points (245, 206) and (453, 213).
; PLAN: r0=245(x1), r1=206(y1), r2=453(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 206
LDI r2, 453
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
