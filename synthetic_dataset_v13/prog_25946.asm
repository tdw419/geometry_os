; DESCRIPTION: Draws a cyan line from (212, 36) to (433, 184).
; PLAN: r0=212(x1), r1=36(y1), r2=433(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 36
LDI r2, 433
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
