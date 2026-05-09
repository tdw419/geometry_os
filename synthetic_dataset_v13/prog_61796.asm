; DESCRIPTION: Draws a yellow line from (261, 44) to (405, 42).
; PLAN: r0=261(x1), r1=44(y1), r2=405(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 44
LDI r2, 405
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
