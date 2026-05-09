; DESCRIPTION: Draws a cyan line from (119, 21) to (131, 82).
; PLAN: r0=119(x1), r1=21(y1), r2=131(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 21
LDI r2, 131
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
