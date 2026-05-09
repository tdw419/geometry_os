; DESCRIPTION: Places a magenta circle of radius 44 at center (415, 173).
; PLAN: r0=415(x), r1=173(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 173
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
