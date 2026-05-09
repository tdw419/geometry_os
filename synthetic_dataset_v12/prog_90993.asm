; DESCRIPTION: Draws a black rectangle at (224, 10) with width 80 and height 113.
; PLAN: r0=224(x), r1=10(y), r2=80(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 10
LDI r2, 80
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
