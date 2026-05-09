; DESCRIPTION: Renders a cyan line between points (480, 40) and (130, 179).
; PLAN: r0=480(x1), r1=40(y1), r2=130(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 40
LDI r2, 130
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
