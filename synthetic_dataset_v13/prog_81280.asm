; DESCRIPTION: Draws a cyan rectangle at (306, 168) with width 29 and height 71.
; PLAN: r0=306(x), r1=168(y), r2=29(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 168
LDI r2, 29
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
