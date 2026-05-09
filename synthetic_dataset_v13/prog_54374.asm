; DESCRIPTION: Draws a black line from (92, 209) to (439, 176).
; PLAN: r0=92(x1), r1=209(y1), r2=439(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 209
LDI r2, 439
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
