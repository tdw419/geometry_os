; DESCRIPTION: Draws a red rectangle at (202, 126) with width 66 and height 103.
; PLAN: r0=202(x), r1=126(y), r2=66(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 126
LDI r2, 66
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
