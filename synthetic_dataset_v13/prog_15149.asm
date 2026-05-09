; DESCRIPTION: Renders a cyan line between points (402, 26) and (454, 61).
; PLAN: r0=402(x1), r1=26(y1), r2=454(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 26
LDI r2, 454
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
