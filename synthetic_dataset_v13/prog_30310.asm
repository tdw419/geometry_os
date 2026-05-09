; DESCRIPTION: Renders a cyan line between points (335, 59) and (488, 12).
; PLAN: r0=335(x1), r1=59(y1), r2=488(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 59
LDI r2, 488
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
