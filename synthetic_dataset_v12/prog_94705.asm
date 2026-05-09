; DESCRIPTION: Draws a cyan line from (66, 254) to (383, 58).
; PLAN: r0=66(x1), r1=254(y1), r2=383(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 254
LDI r2, 383
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
