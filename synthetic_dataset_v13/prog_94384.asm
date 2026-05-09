; DESCRIPTION: Draws a white rectangle at (275, 129) with width 49 and height 54.
; PLAN: r0=275(x), r1=129(y), r2=49(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 129
LDI r2, 49
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
