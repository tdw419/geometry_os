; DESCRIPTION: Renders a cyan line between points (40, 92) and (39, 120).
; PLAN: r0=40(x1), r1=92(y1), r2=39(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 92
LDI r2, 39
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
