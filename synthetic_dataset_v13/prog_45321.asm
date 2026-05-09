; DESCRIPTION: Draws a red line from (207, 32) to (66, 38).
; PLAN: r0=207(x1), r1=32(y1), r2=66(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 32
LDI r2, 66
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
