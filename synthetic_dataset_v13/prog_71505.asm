; DESCRIPTION: Draws a black line from (71, 239) to (264, 26).
; PLAN: r0=71(x1), r1=239(y1), r2=264(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 239
LDI r2, 264
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
