; DESCRIPTION: Draws a red line from (328, 55) to (499, 242).
; PLAN: r0=328(x1), r1=55(y1), r2=499(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 55
LDI r2, 499
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
