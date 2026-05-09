; DESCRIPTION: Draws a red rectangle at (278, 14) with width 42 and height 44.
; PLAN: r0=278(x), r1=14(y), r2=42(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 14
LDI r2, 42
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
