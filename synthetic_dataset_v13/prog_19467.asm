; DESCRIPTION: Places a magenta circle of radius 49 at center (187, 173).
; PLAN: r0=187(x), r1=173(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 173
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
