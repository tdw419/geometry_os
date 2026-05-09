; DESCRIPTION: Places a magenta circle of radius 72 at center (392, 103).
; PLAN: r0=392(x), r1=103(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 103
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
