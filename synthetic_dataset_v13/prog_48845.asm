; DESCRIPTION: Renders a cyan line between points (2, 211) and (30, 248).
; PLAN: r0=2(x1), r1=211(y1), r2=30(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 211
LDI r2, 30
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
