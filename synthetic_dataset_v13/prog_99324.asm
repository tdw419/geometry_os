; DESCRIPTION: Draws a red rectangle at (128, 149) with width 82 and height 14.
; PLAN: r0=128(x), r1=149(y), r2=82(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 149
LDI r2, 82
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
