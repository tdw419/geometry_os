; DESCRIPTION: Draws a cyan rectangle at (70, 129) with width 76 and height 77.
; PLAN: r0=70(x), r1=129(y), r2=76(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 129
LDI r2, 76
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
