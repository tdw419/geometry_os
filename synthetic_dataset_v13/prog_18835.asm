; DESCRIPTION: Renders a cyan line between points (332, 44) and (33, 114).
; PLAN: r0=332(x1), r1=44(y1), r2=33(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 44
LDI r2, 33
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
