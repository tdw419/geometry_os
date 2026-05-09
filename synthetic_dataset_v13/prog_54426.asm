; DESCRIPTION: Renders a cyan line between points (377, 21) and (286, 67).
; PLAN: r0=377(x1), r1=21(y1), r2=286(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 21
LDI r2, 286
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
