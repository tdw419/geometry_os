; DESCRIPTION: Renders a cyan line between points (16, 92) and (466, 109).
; PLAN: r0=16(x1), r1=92(y1), r2=466(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 92
LDI r2, 466
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
