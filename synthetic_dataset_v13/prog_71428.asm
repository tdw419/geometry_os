; DESCRIPTION: Draws a green line from (418, 31) to (434, 209).
; PLAN: r0=418(x1), r1=31(y1), r2=434(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 31
LDI r2, 434
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
