; DESCRIPTION: Draws a black line from (239, 193) to (150, 173).
; PLAN: r0=239(x1), r1=193(y1), r2=150(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 193
LDI r2, 150
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
