; DESCRIPTION: Renders a green line between points (182, 210) and (253, 26).
; PLAN: r0=182(x1), r1=210(y1), r2=253(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 210
LDI r2, 253
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
