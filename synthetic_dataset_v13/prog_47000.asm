; DESCRIPTION: Draws a black line from (146, 236) to (249, 143).
; PLAN: r0=146(x1), r1=236(y1), r2=249(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 236
LDI r2, 249
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
