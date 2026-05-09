; DESCRIPTION: Renders a yellow box of size 53x61 starting at (162, 27).
; PLAN: r0=162(x), r1=27(y), r2=53(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 27
LDI r2, 53
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
