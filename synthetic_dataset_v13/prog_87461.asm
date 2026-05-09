; DESCRIPTION: Draws a white rectangle at (450, 152) with width 40 and height 61.
; PLAN: r0=450(x), r1=152(y), r2=40(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 152
LDI r2, 40
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
