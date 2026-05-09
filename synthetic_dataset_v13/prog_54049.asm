; DESCRIPTION: Places a cyan line segment connecting (441, 198) to (195, 204).
; PLAN: r0=441(x1), r1=198(y1), r2=195(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 198
LDI r2, 195
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
