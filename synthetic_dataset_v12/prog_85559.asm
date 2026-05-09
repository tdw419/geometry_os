; DESCRIPTION: Renders a cyan line between points (321, 82) and (30, 122).
; PLAN: r0=321(x1), r1=82(y1), r2=30(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 82
LDI r2, 30
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
