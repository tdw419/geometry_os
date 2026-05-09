; DESCRIPTION: Draws a black rectangle at (467, 189) with width 42 and height 21.
; PLAN: r0=467(x), r1=189(y), r2=42(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 189
LDI r2, 42
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
