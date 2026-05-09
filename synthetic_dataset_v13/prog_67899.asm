; DESCRIPTION: Draws a red line from (278, 207) to (168, 143).
; PLAN: r0=278(x1), r1=207(y1), r2=168(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 207
LDI r2, 168
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
