; DESCRIPTION: Draws a blue line from (281, 126) to (365, 139).
; PLAN: r0=281(x1), r1=126(y1), r2=365(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 126
LDI r2, 365
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
