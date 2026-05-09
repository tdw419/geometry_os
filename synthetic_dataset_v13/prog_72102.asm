; DESCRIPTION: Draws a cyan rectangle at (191, 204) with width 57 and height 25.
; PLAN: r0=191(x), r1=204(y), r2=57(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 204
LDI r2, 57
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
