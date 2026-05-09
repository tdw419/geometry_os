; DESCRIPTION: Draws a cyan rectangle at (209, 112) with width 35 and height 71.
; PLAN: r0=209(x), r1=112(y), r2=35(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 112
LDI r2, 35
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
