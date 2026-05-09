; DESCRIPTION: Renders a cyan line between points (62, 206) and (375, 247).
; PLAN: r0=62(x1), r1=206(y1), r2=375(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 206
LDI r2, 375
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
