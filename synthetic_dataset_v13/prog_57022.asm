; DESCRIPTION: Renders a cyan line between points (402, 138) and (460, 153).
; PLAN: r0=402(x1), r1=138(y1), r2=460(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 138
LDI r2, 460
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
