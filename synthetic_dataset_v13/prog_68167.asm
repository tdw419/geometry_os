; DESCRIPTION: Draws a red line from (255, 39) to (327, 253).
; PLAN: r0=255(x1), r1=39(y1), r2=327(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 39
LDI r2, 327
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
