; DESCRIPTION: Draws a red rectangle at (395, 191) with width 61 and height 32.
; PLAN: r0=395(x), r1=191(y), r2=61(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 191
LDI r2, 61
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
