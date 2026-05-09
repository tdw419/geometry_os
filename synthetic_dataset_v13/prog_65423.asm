; DESCRIPTION: Draws a white rectangle at (245, 141) with width 90 and height 10.
; PLAN: r0=245(x), r1=141(y), r2=90(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 141
LDI r2, 90
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
