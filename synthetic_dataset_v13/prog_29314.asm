; DESCRIPTION: Draws a black line from (146, 37) to (111, 47).
; PLAN: r0=146(x1), r1=37(y1), r2=111(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 37
LDI r2, 111
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
