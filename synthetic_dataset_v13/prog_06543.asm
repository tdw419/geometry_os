; DESCRIPTION: Renders a cyan line between points (113, 45) and (186, 123).
; PLAN: r0=113(x1), r1=45(y1), r2=186(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 45
LDI r2, 186
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
