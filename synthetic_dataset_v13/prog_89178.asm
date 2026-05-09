; DESCRIPTION: Renders a cyan line between points (9, 10) and (394, 252).
; PLAN: r0=9(x1), r1=10(y1), r2=394(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 10
LDI r2, 394
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
