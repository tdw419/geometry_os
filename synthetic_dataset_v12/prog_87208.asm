; DESCRIPTION: Draws a black line from (239, 143) to (248, 143).
; PLAN: r0=239(x1), r1=143(y1), r2=248(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 143
LDI r2, 248
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
