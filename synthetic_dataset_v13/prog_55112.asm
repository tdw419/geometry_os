; DESCRIPTION: Draws a cyan rectangle at (194, 191) with width 46 and height 24.
; PLAN: r0=194(x), r1=191(y), r2=46(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 191
LDI r2, 46
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
