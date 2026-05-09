; DESCRIPTION: Draws a orange rectangle at (392, 129) with width 15 and height 29.
; PLAN: r0=392(x), r1=129(y), r2=15(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 129
LDI r2, 15
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
