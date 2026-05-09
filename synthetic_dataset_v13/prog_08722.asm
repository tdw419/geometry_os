; DESCRIPTION: Draws a cyan line from (332, 139) to (433, 56).
; PLAN: r0=332(x1), r1=139(y1), r2=433(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 139
LDI r2, 433
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
