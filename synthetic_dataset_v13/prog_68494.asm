; DESCRIPTION: Draws a red rectangle at (206, 0) with width 86 and height 95.
; PLAN: r0=206(x), r1=0(y), r2=86(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 0
LDI r2, 86
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
