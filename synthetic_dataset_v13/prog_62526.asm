; DESCRIPTION: Places a magenta line segment connecting (239, 58) to (123, 126).
; PLAN: r0=239(x1), r1=58(y1), r2=123(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 58
LDI r2, 123
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
