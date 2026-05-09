; DESCRIPTION: Draws a black line from (16, 17) to (146, 146).
; PLAN: r0=16(x1), r1=17(y1), r2=146(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 17
LDI r2, 146
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
