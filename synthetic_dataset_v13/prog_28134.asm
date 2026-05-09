; DESCRIPTION: Renders a cyan line between points (137, 109) and (28, 171).
; PLAN: r0=137(x1), r1=109(y1), r2=28(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 109
LDI r2, 28
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
