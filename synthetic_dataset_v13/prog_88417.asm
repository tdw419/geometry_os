; DESCRIPTION: Renders a cyan line between points (12, 230) and (330, 62).
; PLAN: r0=12(x1), r1=230(y1), r2=330(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 230
LDI r2, 330
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
