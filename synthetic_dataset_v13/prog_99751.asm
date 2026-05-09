; DESCRIPTION: Draws a yellow line from (42, 232) to (152, 215).
; PLAN: r0=42(x1), r1=232(y1), r2=152(x2), r3=215(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 232
LDI r2, 152
LDI r3, 215
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
