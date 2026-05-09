; DESCRIPTION: Renders a green line between points (42, 151) and (444, 44).
; PLAN: r0=42(x1), r1=151(y1), r2=444(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 151
LDI r2, 444
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
