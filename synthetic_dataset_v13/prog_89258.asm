; DESCRIPTION: Draws a cyan rectangle at (269, 63) with width 71 and height 24.
; PLAN: r0=269(x), r1=63(y), r2=71(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 63
LDI r2, 71
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
