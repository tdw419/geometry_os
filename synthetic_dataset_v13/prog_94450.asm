; DESCRIPTION: Draws a white line from (67, 208) to (239, 56).
; PLAN: r0=67(x1), r1=208(y1), r2=239(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 208
LDI r2, 239
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
