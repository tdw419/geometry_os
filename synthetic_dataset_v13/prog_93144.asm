; DESCRIPTION: Renders a cyan line between points (134, 215) and (6, 100).
; PLAN: r0=134(x1), r1=215(y1), r2=6(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 215
LDI r2, 6
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
