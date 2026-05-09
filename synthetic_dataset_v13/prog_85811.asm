; DESCRIPTION: Draws a cyan rectangle at (59, 63) with width 40 and height 71.
; PLAN: r0=59(x), r1=63(y), r2=40(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 63
LDI r2, 40
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
