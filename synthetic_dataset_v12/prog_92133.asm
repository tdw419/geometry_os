; DESCRIPTION: Renders a cyan line between points (95, 194) and (409, 62).
; PLAN: r0=95(x1), r1=194(y1), r2=409(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 194
LDI r2, 409
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
