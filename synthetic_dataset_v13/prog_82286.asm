; DESCRIPTION: Draws a cyan rectangle at (320, 129) with width 29 and height 102.
; PLAN: r0=320(x), r1=129(y), r2=29(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 129
LDI r2, 29
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
