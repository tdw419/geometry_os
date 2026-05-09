; DESCRIPTION: Draws a cyan line from (363, 157) to (216, 32).
; PLAN: r0=363(x1), r1=157(y1), r2=216(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 157
LDI r2, 216
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
