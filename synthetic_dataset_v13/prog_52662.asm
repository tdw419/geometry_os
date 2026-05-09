; DESCRIPTION: Renders a cyan line between points (45, 114) and (382, 196).
; PLAN: r0=45(x1), r1=114(y1), r2=382(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 114
LDI r2, 382
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
