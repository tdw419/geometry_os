; DESCRIPTION: Draws a black line from (446, 58) to (90, 86).
; PLAN: r0=446(x1), r1=58(y1), r2=90(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 58
LDI r2, 90
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
