; DESCRIPTION: Draws a green line from (273, 195) to (372, 128).
; PLAN: r0=273(x1), r1=195(y1), r2=372(x2), r3=128(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 195
LDI r2, 372
LDI r3, 128
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
