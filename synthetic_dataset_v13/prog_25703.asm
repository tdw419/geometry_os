; DESCRIPTION: Draws a magenta line from (281, 172) to (186, 38).
; PLAN: r0=281(x1), r1=172(y1), r2=186(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 172
LDI r2, 186
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
