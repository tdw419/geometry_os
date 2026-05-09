; DESCRIPTION: Draws a magenta line from (207, 114) to (239, 248).
; PLAN: r0=207(x1), r1=114(y1), r2=239(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 114
LDI r2, 239
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
