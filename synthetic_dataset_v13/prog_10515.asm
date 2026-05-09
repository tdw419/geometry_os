; DESCRIPTION: Draws a white line from (38, 94) to (460, 168).
; PLAN: r0=38(x1), r1=94(y1), r2=460(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 94
LDI r2, 460
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
