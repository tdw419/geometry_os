; DESCRIPTION: Renders a cyan line between points (378, 255) and (402, 108).
; PLAN: r0=378(x1), r1=255(y1), r2=402(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 255
LDI r2, 402
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
