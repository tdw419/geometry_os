; DESCRIPTION: Draws a yellow line from (329, 67) to (174, 95).
; PLAN: r0=329(x1), r1=67(y1), r2=174(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 67
LDI r2, 174
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
