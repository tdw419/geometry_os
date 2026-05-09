; DESCRIPTION: Renders a cyan line between points (253, 194) and (52, 108).
; PLAN: r0=253(x1), r1=194(y1), r2=52(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 194
LDI r2, 52
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
