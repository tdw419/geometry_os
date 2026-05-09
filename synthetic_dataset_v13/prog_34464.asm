; DESCRIPTION: Draws a black line from (197, 12) to (213, 7).
; PLAN: r0=197(x1), r1=12(y1), r2=213(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 12
LDI r2, 213
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
