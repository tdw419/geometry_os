; DESCRIPTION: Draws a black line from (380, 151) to (420, 126).
; PLAN: r0=380(x1), r1=151(y1), r2=420(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 151
LDI r2, 420
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
