; DESCRIPTION: Renders a cyan line between points (480, 136) and (183, 2).
; PLAN: r0=480(x1), r1=136(y1), r2=183(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 136
LDI r2, 183
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
