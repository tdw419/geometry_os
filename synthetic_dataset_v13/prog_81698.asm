; DESCRIPTION: Draws a yellow line from (410, 226) to (68, 169).
; PLAN: r0=410(x1), r1=226(y1), r2=68(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 226
LDI r2, 68
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
