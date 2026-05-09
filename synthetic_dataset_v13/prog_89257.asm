; DESCRIPTION: Renders a black box of size 91x16 starting at (91, 183).
; PLAN: r0=91(x), r1=183(y), r2=91(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 183
LDI r2, 91
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
