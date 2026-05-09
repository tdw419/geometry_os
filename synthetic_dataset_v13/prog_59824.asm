; DESCRIPTION: Draws a black line from (168, 18) to (177, 138).
; PLAN: r0=168(x1), r1=18(y1), r2=177(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 18
LDI r2, 177
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
