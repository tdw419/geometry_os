; DESCRIPTION: Renders a cyan line between points (95, 28) and (38, 75).
; PLAN: r0=95(x1), r1=28(y1), r2=38(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 28
LDI r2, 38
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
