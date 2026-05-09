; DESCRIPTION: Draws a green line from (240, 190) to (255, 186).
; PLAN: r0=240(x1), r1=190(y1), r2=255(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 190
LDI r2, 255
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
