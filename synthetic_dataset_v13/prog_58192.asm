; DESCRIPTION: Renders a cyan line between points (230, 23) and (114, 0).
; PLAN: r0=230(x1), r1=23(y1), r2=114(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 23
LDI r2, 114
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
