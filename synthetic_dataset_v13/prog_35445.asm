; DESCRIPTION: Renders a white line between points (6, 114) and (475, 213).
; PLAN: r0=6(x1), r1=114(y1), r2=475(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 114
LDI r2, 475
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
