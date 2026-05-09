; DESCRIPTION: Places a blue circle of radius 70 at center (267, 154).
; PLAN: r0=267(x), r1=154(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 154
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
