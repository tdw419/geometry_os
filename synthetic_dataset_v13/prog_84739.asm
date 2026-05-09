; DESCRIPTION: Renders a cyan line between points (90, 15) and (72, 81).
; PLAN: r0=90(x1), r1=15(y1), r2=72(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 15
LDI r2, 72
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
