; DESCRIPTION: Renders a green box of size 61x35 starting at (16, 138).
; PLAN: r0=16(x), r1=138(y), r2=61(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 138
LDI r2, 61
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
