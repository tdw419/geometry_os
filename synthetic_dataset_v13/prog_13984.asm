; DESCRIPTION: Renders a cyan line between points (330, 183) and (288, 21).
; PLAN: r0=330(x1), r1=183(y1), r2=288(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 183
LDI r2, 288
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
