; DESCRIPTION: Renders a cyan line between points (86, 69) and (335, 0).
; PLAN: r0=86(x1), r1=69(y1), r2=335(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 69
LDI r2, 335
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
