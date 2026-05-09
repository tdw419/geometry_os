; DESCRIPTION: Draws a cyan line from (466, 59) to (149, 139).
; PLAN: r0=466(x1), r1=59(y1), r2=149(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 59
LDI r2, 149
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
