; DESCRIPTION: Draws a black line from (482, 220) to (494, 128).
; PLAN: r0=482(x1), r1=220(y1), r2=494(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 220
LDI r2, 494
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
