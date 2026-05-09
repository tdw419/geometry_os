; DESCRIPTION: Renders a cyan line between points (428, 253) and (490, 2).
; PLAN: r0=428(x1), r1=253(y1), r2=490(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 253
LDI r2, 490
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
