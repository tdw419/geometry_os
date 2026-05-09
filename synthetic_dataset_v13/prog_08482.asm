; DESCRIPTION: Places a magenta circle of radius 58 at center (239, 150).
; PLAN: r0=239(x), r1=150(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 150
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
