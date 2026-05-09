; DESCRIPTION: Draws a red rectangle at (245, 112) with width 42 and height 118.
; PLAN: r0=245(x), r1=112(y), r2=42(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 112
LDI r2, 42
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
