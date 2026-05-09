; DESCRIPTION: Draws a yellow line from (305, 254) to (418, 156).
; PLAN: r0=305(x1), r1=254(y1), r2=418(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 254
LDI r2, 418
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
