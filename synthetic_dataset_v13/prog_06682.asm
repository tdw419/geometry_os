; DESCRIPTION: Draws a black line from (492, 215) to (184, 186).
; PLAN: r0=492(x1), r1=215(y1), r2=184(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 215
LDI r2, 184
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
