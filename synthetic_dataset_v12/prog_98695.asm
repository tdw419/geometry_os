; DESCRIPTION: Renders a cyan line between points (166, 46) and (172, 47).
; PLAN: r0=166(x1), r1=46(y1), r2=172(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 46
LDI r2, 172
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
