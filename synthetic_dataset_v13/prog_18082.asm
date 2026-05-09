; DESCRIPTION: Draws a green line from (59, 186) to (5, 45).
; PLAN: r0=59(x1), r1=186(y1), r2=5(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 186
LDI r2, 5
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
