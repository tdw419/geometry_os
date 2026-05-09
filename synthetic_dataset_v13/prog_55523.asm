; DESCRIPTION: Renders a cyan line between points (154, 14) and (245, 122).
; PLAN: r0=154(x1), r1=14(y1), r2=245(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 14
LDI r2, 245
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
