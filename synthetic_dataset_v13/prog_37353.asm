; DESCRIPTION: Renders a red line between points (225, 39) and (84, 231).
; PLAN: r0=225(x1), r1=39(y1), r2=84(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 39
LDI r2, 84
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
