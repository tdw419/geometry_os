; DESCRIPTION: Renders a cyan line between points (159, 114) and (72, 39).
; PLAN: r0=159(x1), r1=114(y1), r2=72(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 114
LDI r2, 72
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
