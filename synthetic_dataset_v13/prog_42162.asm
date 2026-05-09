; DESCRIPTION: Draws a black line from (405, 254) to (202, 6).
; PLAN: r0=405(x1), r1=254(y1), r2=202(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 254
LDI r2, 202
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
