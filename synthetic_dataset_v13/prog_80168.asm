; DESCRIPTION: Draws a cyan rectangle at (446, 0) with width 11 and height 85.
; PLAN: r0=446(x), r1=0(y), r2=11(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 0
LDI r2, 11
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
