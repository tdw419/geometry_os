; DESCRIPTION: Draws a orange rectangle at (206, 129) with width 61 and height 52.
; PLAN: r0=206(x), r1=129(y), r2=61(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 129
LDI r2, 61
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
