; DESCRIPTION: Renders a green box of size 58x61 starting at (62, 27).
; PLAN: r0=62(x), r1=27(y), r2=58(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 27
LDI r2, 58
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
