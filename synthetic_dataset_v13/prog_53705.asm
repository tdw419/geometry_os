; DESCRIPTION: Renders a cyan line between points (59, 190) and (67, 119).
; PLAN: r0=59(x1), r1=190(y1), r2=67(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 190
LDI r2, 67
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
