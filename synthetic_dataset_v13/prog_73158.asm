; DESCRIPTION: Renders a cyan line between points (54, 148) and (97, 60).
; PLAN: r0=54(x1), r1=148(y1), r2=97(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 148
LDI r2, 97
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
