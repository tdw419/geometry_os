; DESCRIPTION: Draws a cyan rectangle at (421, 2) with width 82 and height 120.
; PLAN: r0=421(x), r1=2(y), r2=82(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 2
LDI r2, 82
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
