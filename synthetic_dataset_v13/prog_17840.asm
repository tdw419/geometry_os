; DESCRIPTION: Draws a cyan rectangle at (409, 129) with width 97 and height 91.
; PLAN: r0=409(x), r1=129(y), r2=97(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 129
LDI r2, 97
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
