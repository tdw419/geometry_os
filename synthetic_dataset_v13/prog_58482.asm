; DESCRIPTION: Renders a cyan line between points (82, 132) and (56, 104).
; PLAN: r0=82(x1), r1=132(y1), r2=56(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 132
LDI r2, 56
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
