; DESCRIPTION: Draws a red rectangle at (297, 72) with width 90 and height 16.
; PLAN: r0=297(x), r1=72(y), r2=90(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 72
LDI r2, 90
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
