; DESCRIPTION: Draws a red line from (181, 186) to (340, 210).
; PLAN: r0=181(x1), r1=186(y1), r2=340(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 186
LDI r2, 340
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
