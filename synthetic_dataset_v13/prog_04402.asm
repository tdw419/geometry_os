; DESCRIPTION: Draws a red line from (460, 116) to (64, 191).
; PLAN: r0=460(x1), r1=116(y1), r2=64(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 116
LDI r2, 64
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
