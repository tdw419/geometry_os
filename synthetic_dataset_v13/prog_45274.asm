; DESCRIPTION: Renders a cyan line between points (342, 7) and (74, 152).
; PLAN: r0=342(x1), r1=7(y1), r2=74(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 7
LDI r2, 74
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
