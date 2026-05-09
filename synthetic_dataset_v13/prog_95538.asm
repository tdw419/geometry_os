; DESCRIPTION: Draws a white line from (113, 108) to (95, 146).
; PLAN: r0=113(x1), r1=108(y1), r2=95(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 108
LDI r2, 95
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
