; DESCRIPTION: Renders a cyan line between points (227, 140) and (382, 178).
; PLAN: r0=227(x1), r1=140(y1), r2=382(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 140
LDI r2, 382
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
