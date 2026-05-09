; DESCRIPTION: Renders a cyan line between points (342, 152) and (43, 63).
; PLAN: r0=342(x1), r1=152(y1), r2=43(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 152
LDI r2, 43
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
