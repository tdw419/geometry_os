; DESCRIPTION: Draws a black line from (46, 58) to (173, 27).
; PLAN: r0=46(x1), r1=58(y1), r2=173(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 58
LDI r2, 173
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
