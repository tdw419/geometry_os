; DESCRIPTION: Renders a green box of size 52x53 starting at (278, 25).
; PLAN: r0=278(x), r1=25(y), r2=52(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 25
LDI r2, 52
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
