; DESCRIPTION: Draws a cyan rectangle at (175, 70) with width 46 and height 71.
; PLAN: r0=175(x), r1=70(y), r2=46(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 70
LDI r2, 46
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
