; DESCRIPTION: Draws a green line from (116, 255) to (50, 33).
; PLAN: r0=116(x1), r1=255(y1), r2=50(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 255
LDI r2, 50
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
