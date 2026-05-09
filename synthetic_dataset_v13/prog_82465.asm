; DESCRIPTION: Renders a cyan line between points (253, 238) and (473, 95).
; PLAN: r0=253(x1), r1=238(y1), r2=473(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 238
LDI r2, 473
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
