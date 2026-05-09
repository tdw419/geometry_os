; DESCRIPTION: Renders a green line between points (199, 154) and (39, 181).
; PLAN: r0=199(x1), r1=154(y1), r2=39(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 154
LDI r2, 39
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
