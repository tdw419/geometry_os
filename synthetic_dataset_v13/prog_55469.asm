; DESCRIPTION: Renders a cyan line between points (191, 42) and (71, 72).
; PLAN: r0=191(x1), r1=42(y1), r2=71(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 42
LDI r2, 71
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
