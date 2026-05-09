; DESCRIPTION: Draws a red rectangle at (115, 152) with width 111 and height 75.
; PLAN: r0=115(x), r1=152(y), r2=111(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 152
LDI r2, 111
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
