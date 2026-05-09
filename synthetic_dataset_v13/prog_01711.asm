; DESCRIPTION: Draws a green line from (327, 240) to (439, 33).
; PLAN: r0=327(x1), r1=240(y1), r2=439(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 240
LDI r2, 439
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
