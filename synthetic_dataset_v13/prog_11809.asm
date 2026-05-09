; DESCRIPTION: Renders a cyan line between points (386, 60) and (192, 74).
; PLAN: r0=386(x1), r1=60(y1), r2=192(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 60
LDI r2, 192
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
