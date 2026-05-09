; DESCRIPTION: Draws a white rectangle at (294, 211) with width 105 and height 34.
; PLAN: r0=294(x), r1=211(y), r2=105(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 211
LDI r2, 105
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
