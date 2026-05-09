; DESCRIPTION: Draws a white line from (17, 128) to (263, 37).
; PLAN: r0=17(x1), r1=128(y1), r2=263(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 128
LDI r2, 263
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
