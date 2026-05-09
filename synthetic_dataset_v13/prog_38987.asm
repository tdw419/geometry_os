; DESCRIPTION: Draws a red rectangle at (370, 128) with width 18 and height 120.
; PLAN: r0=370(x), r1=128(y), r2=18(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 128
LDI r2, 18
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
