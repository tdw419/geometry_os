; DESCRIPTION: Draws a purple line from (262, 154) to (234, 146).
; PLAN: r0=262(x1), r1=154(y1), r2=234(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 154
LDI r2, 234
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
