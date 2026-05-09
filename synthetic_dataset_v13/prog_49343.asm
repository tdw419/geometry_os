; DESCRIPTION: Renders a cyan line between points (356, 238) and (25, 38).
; PLAN: r0=356(x1), r1=238(y1), r2=25(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 238
LDI r2, 25
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
