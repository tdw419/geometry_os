; DESCRIPTION: Draws a cyan rectangle at (52, 27) with width 50 and height 92.
; PLAN: r0=52(x), r1=27(y), r2=50(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 27
LDI r2, 50
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
