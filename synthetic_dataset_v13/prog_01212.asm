; DESCRIPTION: Draws a cyan line from (381, 236) to (441, 168).
; PLAN: r0=381(x1), r1=236(y1), r2=441(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 236
LDI r2, 441
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
