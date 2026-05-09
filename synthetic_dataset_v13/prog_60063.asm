; DESCRIPTION: Places a green circle of radius 61 at center (438, 151).
; PLAN: r0=438(x), r1=151(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 151
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
