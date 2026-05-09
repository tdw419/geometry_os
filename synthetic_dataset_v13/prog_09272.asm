; DESCRIPTION: Draws a black line from (66, 242) to (21, 197).
; PLAN: r0=66(x1), r1=242(y1), r2=21(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 242
LDI r2, 21
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
