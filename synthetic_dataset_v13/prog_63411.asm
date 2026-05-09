; DESCRIPTION: Draws a black line from (410, 183) to (279, 39).
; PLAN: r0=410(x1), r1=183(y1), r2=279(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 183
LDI r2, 279
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
