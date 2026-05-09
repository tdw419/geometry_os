; DESCRIPTION: Draws a green line from (328, 190) to (380, 198).
; PLAN: r0=328(x1), r1=190(y1), r2=380(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 190
LDI r2, 380
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
