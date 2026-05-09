; DESCRIPTION: Draws a white line from (121, 54) to (231, 210).
; PLAN: r0=121(x1), r1=54(y1), r2=231(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 54
LDI r2, 231
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
