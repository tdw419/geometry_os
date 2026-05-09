; DESCRIPTION: Places a orange circle of radius 67 at center (386, 151).
; PLAN: r0=386(x), r1=151(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 151
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
