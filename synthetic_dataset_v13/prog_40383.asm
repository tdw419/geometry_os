; DESCRIPTION: Renders a cyan line between points (119, 213) and (116, 186).
; PLAN: r0=119(x1), r1=213(y1), r2=116(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 213
LDI r2, 116
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
