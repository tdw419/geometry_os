; DESCRIPTION: Renders a cyan line between points (206, 58) and (475, 17).
; PLAN: r0=206(x1), r1=58(y1), r2=475(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 58
LDI r2, 475
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
