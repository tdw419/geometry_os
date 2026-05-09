; DESCRIPTION: Draws a green line from (401, 175) to (114, 46).
; PLAN: r0=401(x1), r1=175(y1), r2=114(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 175
LDI r2, 114
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
