; DESCRIPTION: Draws a yellow line from (108, 171) to (154, 71).
; PLAN: r0=108(x1), r1=171(y1), r2=154(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 171
LDI r2, 154
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
