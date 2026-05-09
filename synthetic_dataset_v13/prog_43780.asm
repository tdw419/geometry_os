; DESCRIPTION: Draws a green line from (182, 117) to (176, 138).
; PLAN: r0=182(x1), r1=117(y1), r2=176(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 117
LDI r2, 176
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
