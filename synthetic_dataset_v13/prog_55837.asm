; DESCRIPTION: Draws a cyan line from (469, 193) to (193, 204).
; PLAN: r0=469(x1), r1=193(y1), r2=193(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 193
LDI r2, 193
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
