; DESCRIPTION: Draws a red rectangle at (169, 146) with width 72 and height 48.
; PLAN: r0=169(x), r1=146(y), r2=72(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 146
LDI r2, 72
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
