; DESCRIPTION: Draws a cyan line from (214, 193) to (378, 87).
; PLAN: r0=214(x1), r1=193(y1), r2=378(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 193
LDI r2, 378
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
