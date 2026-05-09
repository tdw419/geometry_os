; DESCRIPTION: Places a magenta circle of radius 46 at center (372, 113).
; PLAN: r0=372(x), r1=113(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 113
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
