; DESCRIPTION: Renders a cyan line between points (217, 245) and (490, 108).
; PLAN: r0=217(x1), r1=245(y1), r2=490(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 245
LDI r2, 490
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
