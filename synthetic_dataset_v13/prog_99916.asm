; DESCRIPTION: Renders a cyan line between points (154, 7) and (81, 105).
; PLAN: r0=154(x1), r1=7(y1), r2=81(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 7
LDI r2, 81
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
