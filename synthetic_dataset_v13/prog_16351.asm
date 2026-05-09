; DESCRIPTION: Draws a white rectangle at (152, 98) with width 27 and height 27.
; PLAN: r0=152(x), r1=98(y), r2=27(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 98
LDI r2, 27
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
