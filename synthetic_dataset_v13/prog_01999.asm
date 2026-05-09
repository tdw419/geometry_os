; DESCRIPTION: Renders a cyan line between points (225, 230) and (260, 253).
; PLAN: r0=225(x1), r1=230(y1), r2=260(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 230
LDI r2, 260
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
