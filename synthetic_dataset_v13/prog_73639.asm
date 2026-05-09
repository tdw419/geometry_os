; DESCRIPTION: Draws a red line from (250, 108) to (228, 113).
; PLAN: r0=250(x1), r1=108(y1), r2=228(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 108
LDI r2, 228
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
