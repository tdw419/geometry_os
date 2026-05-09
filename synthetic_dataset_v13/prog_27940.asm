; DESCRIPTION: Draws a cyan line from (479, 47) to (376, 137).
; PLAN: r0=479(x1), r1=47(y1), r2=376(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 47
LDI r2, 376
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
