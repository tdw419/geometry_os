; DESCRIPTION: Renders a green line between points (460, 59) and (238, 34).
; PLAN: r0=460(x1), r1=59(y1), r2=238(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 59
LDI r2, 238
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
