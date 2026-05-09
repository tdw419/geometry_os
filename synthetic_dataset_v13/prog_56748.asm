; DESCRIPTION: Draws a white rectangle at (424, 129) with width 45 and height 96.
; PLAN: r0=424(x), r1=129(y), r2=45(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 129
LDI r2, 45
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
