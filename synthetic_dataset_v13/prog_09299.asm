; DESCRIPTION: Renders a cyan line between points (419, 148) and (316, 16).
; PLAN: r0=419(x1), r1=148(y1), r2=316(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 148
LDI r2, 316
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
