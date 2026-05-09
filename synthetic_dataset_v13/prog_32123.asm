; DESCRIPTION: Draws a red line from (239, 190) to (113, 220).
; PLAN: r0=239(x1), r1=190(y1), r2=113(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 190
LDI r2, 113
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
