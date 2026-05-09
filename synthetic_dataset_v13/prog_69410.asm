; DESCRIPTION: Draws a cyan rectangle at (354, 61) with width 50 and height 12.
; PLAN: r0=354(x), r1=61(y), r2=50(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 61
LDI r2, 50
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
