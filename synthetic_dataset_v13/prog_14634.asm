; DESCRIPTION: Renders a cyan line between points (490, 50) and (460, 97).
; PLAN: r0=490(x1), r1=50(y1), r2=460(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 50
LDI r2, 460
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
