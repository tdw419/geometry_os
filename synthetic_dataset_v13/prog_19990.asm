; DESCRIPTION: Draws a cyan rectangle at (373, 24) with width 17 and height 113.
; PLAN: r0=373(x), r1=24(y), r2=17(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 24
LDI r2, 17
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
