; DESCRIPTION: Renders a green line between points (96, 179) and (425, 27).
; PLAN: r0=96(x1), r1=179(y1), r2=425(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 179
LDI r2, 425
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
