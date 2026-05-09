; DESCRIPTION: Renders a cyan line between points (253, 30) and (132, 18).
; PLAN: r0=253(x1), r1=30(y1), r2=132(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 30
LDI r2, 132
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
