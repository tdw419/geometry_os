; DESCRIPTION: Draws a green line from (165, 109) to (304, 208).
; PLAN: r0=165(x1), r1=109(y1), r2=304(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 109
LDI r2, 304
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
