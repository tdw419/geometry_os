; DESCRIPTION: Draws a black line from (435, 41) to (387, 16).
; PLAN: r0=435(x1), r1=41(y1), r2=387(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 41
LDI r2, 387
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
