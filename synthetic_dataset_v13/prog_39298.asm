; DESCRIPTION: Draws a cyan rectangle at (202, 83) with width 86 and height 71.
; PLAN: r0=202(x), r1=83(y), r2=86(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 83
LDI r2, 86
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
