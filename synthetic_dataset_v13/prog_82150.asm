; DESCRIPTION: Draws a cyan rectangle at (65, 115) with width 46 and height 111.
; PLAN: r0=65(x), r1=115(y), r2=46(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 115
LDI r2, 46
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
