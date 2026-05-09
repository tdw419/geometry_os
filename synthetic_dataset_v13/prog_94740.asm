; DESCRIPTION: Draws a black rectangle at (295, 73) with width 98 and height 10.
; PLAN: r0=295(x), r1=73(y), r2=98(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 73
LDI r2, 98
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
