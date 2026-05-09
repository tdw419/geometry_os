; DESCRIPTION: Draws a black line from (387, 18) to (126, 134).
; PLAN: r0=387(x1), r1=18(y1), r2=126(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 18
LDI r2, 126
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
