; DESCRIPTION: Draws a cyan rectangle at (152, 146) with width 74 and height 74.
; PLAN: r0=152(x), r1=146(y), r2=74(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 146
LDI r2, 74
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
