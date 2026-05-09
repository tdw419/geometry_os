; DESCRIPTION: Places a magenta circle of radius 50 at center (116, 138).
; PLAN: r0=116(x), r1=138(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 138
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
