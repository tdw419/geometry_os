; DESCRIPTION: Renders a cyan line between points (89, 196) and (350, 12).
; PLAN: r0=89(x1), r1=196(y1), r2=350(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 196
LDI r2, 350
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
