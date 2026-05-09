; DESCRIPTION: Draws a red line from (116, 9) to (480, 213).
; PLAN: r0=116(x1), r1=9(y1), r2=480(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 9
LDI r2, 480
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
