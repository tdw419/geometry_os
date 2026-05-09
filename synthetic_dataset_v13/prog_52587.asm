; DESCRIPTION: Draws a red line from (333, 114) to (460, 94).
; PLAN: r0=333(x1), r1=114(y1), r2=460(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 114
LDI r2, 460
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
