; DESCRIPTION: Draws a white rectangle at (165, 129) with width 48 and height 21.
; PLAN: r0=165(x), r1=129(y), r2=48(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 129
LDI r2, 48
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
