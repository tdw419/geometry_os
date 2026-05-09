; DESCRIPTION: Renders a cyan line between points (241, 48) and (205, 134).
; PLAN: r0=241(x1), r1=48(y1), r2=205(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 48
LDI r2, 205
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
