; DESCRIPTION: Renders a cyan line between points (34, 208) and (278, 206).
; PLAN: r0=34(x1), r1=208(y1), r2=278(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 208
LDI r2, 278
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
