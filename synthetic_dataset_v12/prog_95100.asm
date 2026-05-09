; DESCRIPTION: Draws a black line from (364, 205) to (259, 27).
; PLAN: r0=364(x1), r1=205(y1), r2=259(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 205
LDI r2, 259
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
