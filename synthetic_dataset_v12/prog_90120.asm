; DESCRIPTION: Renders a cyan line between points (508, 104) and (58, 174).
; PLAN: r0=508(x1), r1=104(y1), r2=58(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 104
LDI r2, 58
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
