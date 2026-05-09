; DESCRIPTION: Draws a black line from (242, 113) to (98, 19).
; PLAN: r0=242(x1), r1=113(y1), r2=98(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 113
LDI r2, 98
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
