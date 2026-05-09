; DESCRIPTION: Draws a blue line from (228, 117) to (248, 186).
; PLAN: r0=228(x1), r1=117(y1), r2=248(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 117
LDI r2, 248
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
