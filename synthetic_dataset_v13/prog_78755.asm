; DESCRIPTION: Draws a red rectangle at (242, 13) with width 60 and height 62.
; PLAN: r0=242(x), r1=13(y), r2=60(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 13
LDI r2, 60
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
