; DESCRIPTION: Draws a black line from (346, 183) to (18, 243).
; PLAN: r0=346(x1), r1=183(y1), r2=18(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 183
LDI r2, 18
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
