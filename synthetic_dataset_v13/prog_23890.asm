; DESCRIPTION: Renders a cyan line between points (192, 0) and (57, 20).
; PLAN: r0=192(x1), r1=0(y1), r2=57(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 0
LDI r2, 57
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
