; DESCRIPTION: Draws a black line from (383, 115) to (354, 213).
; PLAN: r0=383(x1), r1=115(y1), r2=354(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 115
LDI r2, 354
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
