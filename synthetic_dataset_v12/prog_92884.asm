; DESCRIPTION: Renders a cyan line between points (308, 54) and (328, 109).
; PLAN: r0=308(x1), r1=54(y1), r2=328(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 54
LDI r2, 328
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
