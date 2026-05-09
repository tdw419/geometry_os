; DESCRIPTION: Draws a white rectangle at (413, 129) with width 75 and height 120.
; PLAN: r0=413(x), r1=129(y), r2=75(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 129
LDI r2, 75
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
