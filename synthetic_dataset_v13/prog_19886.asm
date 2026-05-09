; DESCRIPTION: Draws a black line from (2, 209) to (401, 4).
; PLAN: r0=2(x1), r1=209(y1), r2=401(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 209
LDI r2, 401
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
