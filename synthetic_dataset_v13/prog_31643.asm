; DESCRIPTION: Draws a red line from (16, 174) to (239, 146).
; PLAN: r0=16(x1), r1=174(y1), r2=239(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 174
LDI r2, 239
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
