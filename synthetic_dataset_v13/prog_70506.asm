; DESCRIPTION: Draws a white rectangle at (413, 20) with width 48 and height 27.
; PLAN: r0=413(x), r1=20(y), r2=48(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 20
LDI r2, 48
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
