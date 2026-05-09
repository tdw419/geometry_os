; DESCRIPTION: Draws a cyan rectangle at (123, 37) with width 46 and height 86.
; PLAN: r0=123(x), r1=37(y), r2=46(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 37
LDI r2, 46
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
