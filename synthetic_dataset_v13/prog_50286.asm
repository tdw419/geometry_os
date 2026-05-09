; DESCRIPTION: Draws a black line from (393, 215) to (424, 12).
; PLAN: r0=393(x1), r1=215(y1), r2=424(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 215
LDI r2, 424
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
