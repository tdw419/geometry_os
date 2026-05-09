; DESCRIPTION: Places a magenta line segment connecting (113, 239) to (346, 217).
; PLAN: r0=113(x1), r1=239(y1), r2=346(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 239
LDI r2, 346
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
