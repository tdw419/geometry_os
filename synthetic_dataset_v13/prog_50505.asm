; DESCRIPTION: Draws a red rectangle at (112, 152) with width 71 and height 60.
; PLAN: r0=112(x), r1=152(y), r2=71(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 152
LDI r2, 71
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
