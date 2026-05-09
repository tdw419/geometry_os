; DESCRIPTION: Renders a black box of size 63x105 starting at (276, 103).
; PLAN: r0=276(x), r1=103(y), r2=63(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 103
LDI r2, 63
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
