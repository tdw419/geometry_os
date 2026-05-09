; DESCRIPTION: Renders a green line between points (98, 114) and (62, 42).
; PLAN: r0=98(x1), r1=114(y1), r2=62(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 114
LDI r2, 62
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
