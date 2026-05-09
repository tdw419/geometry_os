; DESCRIPTION: Renders a green box of size 115x61 starting at (58, 32).
; PLAN: r0=58(x), r1=32(y), r2=115(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 32
LDI r2, 115
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
