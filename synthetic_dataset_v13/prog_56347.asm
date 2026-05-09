; DESCRIPTION: Draws a cyan rectangle at (71, 67) with width 16 and height 30.
; PLAN: r0=71(x), r1=67(y), r2=16(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 67
LDI r2, 16
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
