; DESCRIPTION: Renders a cyan line between points (285, 67) and (462, 160).
; PLAN: r0=285(x1), r1=67(y1), r2=462(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 67
LDI r2, 462
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
