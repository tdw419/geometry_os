; DESCRIPTION: Draws a cyan line from (310, 147) to (439, 29).
; PLAN: r0=310(x1), r1=147(y1), r2=439(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 147
LDI r2, 439
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
