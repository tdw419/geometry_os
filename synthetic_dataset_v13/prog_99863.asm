; DESCRIPTION: Draws a green line from (510, 237) to (143, 89).
; PLAN: r0=510(x1), r1=237(y1), r2=143(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 237
LDI r2, 143
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
