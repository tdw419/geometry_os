; DESCRIPTION: Draws a black line from (46, 254) to (22, 215).
; PLAN: r0=46(x1), r1=254(y1), r2=22(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 254
LDI r2, 22
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
