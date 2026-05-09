; DESCRIPTION: Draws a cyan rectangle at (393, 99) with width 99 and height 113.
; PLAN: r0=393(x), r1=99(y), r2=99(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 99
LDI r2, 99
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
