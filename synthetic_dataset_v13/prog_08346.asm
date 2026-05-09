; DESCRIPTION: Renders a yellow line between points (401, 138) and (301, 198).
; PLAN: r0=401(x1), r1=138(y1), r2=301(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 138
LDI r2, 301
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
