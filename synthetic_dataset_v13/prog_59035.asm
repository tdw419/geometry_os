; DESCRIPTION: Draws a black line from (46, 206) to (263, 26).
; PLAN: r0=46(x1), r1=206(y1), r2=263(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 206
LDI r2, 263
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
