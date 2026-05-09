; DESCRIPTION: Renders a cyan line between points (87, 78) and (53, 56).
; PLAN: r0=87(x1), r1=78(y1), r2=53(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 78
LDI r2, 53
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
