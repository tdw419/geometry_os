; DESCRIPTION: Renders a cyan line between points (332, 13) and (32, 251).
; PLAN: r0=332(x1), r1=13(y1), r2=32(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 13
LDI r2, 32
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
