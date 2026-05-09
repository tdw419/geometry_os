; DESCRIPTION: Renders a green box of size 53x78 starting at (307, 131).
; PLAN: r0=307(x), r1=131(y), r2=53(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 131
LDI r2, 53
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
