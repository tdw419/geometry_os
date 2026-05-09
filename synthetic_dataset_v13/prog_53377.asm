; DESCRIPTION: Renders a cyan line between points (47, 154) and (332, 64).
; PLAN: r0=47(x1), r1=154(y1), r2=332(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 154
LDI r2, 332
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
