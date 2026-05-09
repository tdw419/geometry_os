; DESCRIPTION: Draws a green line from (264, 240) to (152, 208).
; PLAN: r0=264(x1), r1=240(y1), r2=152(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 240
LDI r2, 152
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
