; DESCRIPTION: Renders a cyan line between points (213, 183) and (500, 49).
; PLAN: r0=213(x1), r1=183(y1), r2=500(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 183
LDI r2, 500
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
