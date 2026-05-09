; DESCRIPTION: Draws a green line from (434, 82) to (441, 3).
; PLAN: r0=434(x1), r1=82(y1), r2=441(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 82
LDI r2, 441
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
