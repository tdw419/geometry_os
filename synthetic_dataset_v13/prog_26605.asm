; DESCRIPTION: Draws a black line from (396, 128) to (215, 253).
; PLAN: r0=396(x1), r1=128(y1), r2=215(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 128
LDI r2, 215
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
