; DESCRIPTION: Draws a yellow line from (306, 73) to (446, 56).
; PLAN: r0=306(x1), r1=73(y1), r2=446(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 73
LDI r2, 446
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
