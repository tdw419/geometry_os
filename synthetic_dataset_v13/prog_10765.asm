; DESCRIPTION: Renders a cyan line between points (111, 207) and (466, 175).
; PLAN: r0=111(x1), r1=207(y1), r2=466(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 207
LDI r2, 466
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
