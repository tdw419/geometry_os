; DESCRIPTION: Renders a cyan line between points (14, 192) and (166, 56).
; PLAN: r0=14(x1), r1=192(y1), r2=166(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 192
LDI r2, 166
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
