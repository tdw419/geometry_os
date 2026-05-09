; DESCRIPTION: Renders a green box of size 16x39 starting at (476, 166).
; PLAN: r0=476(x), r1=166(y), r2=16(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 166
LDI r2, 16
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
