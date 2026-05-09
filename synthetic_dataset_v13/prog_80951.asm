; DESCRIPTION: Draws a yellow line from (198, 159) to (295, 83).
; PLAN: r0=198(x1), r1=159(y1), r2=295(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 159
LDI r2, 295
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
