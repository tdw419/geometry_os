; DESCRIPTION: Renders a cyan line between points (114, 7) and (330, 184).
; PLAN: r0=114(x1), r1=7(y1), r2=330(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 7
LDI r2, 330
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
