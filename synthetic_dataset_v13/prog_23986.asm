; DESCRIPTION: Draws a cyan line from (2, 241) to (19, 231).
; PLAN: r0=2(x1), r1=241(y1), r2=19(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 241
LDI r2, 19
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
