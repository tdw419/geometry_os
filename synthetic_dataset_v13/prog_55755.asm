; DESCRIPTION: Renders a cyan line between points (450, 90) and (96, 10).
; PLAN: r0=450(x1), r1=90(y1), r2=96(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 90
LDI r2, 96
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
