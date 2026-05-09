; DESCRIPTION: Draws a yellow line from (405, 133) to (344, 126).
; PLAN: r0=405(x1), r1=133(y1), r2=344(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 133
LDI r2, 344
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
