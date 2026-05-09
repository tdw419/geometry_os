; DESCRIPTION: Draws a white rectangle at (243, 129) with width 64 and height 100.
; PLAN: r0=243(x), r1=129(y), r2=64(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 129
LDI r2, 64
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
