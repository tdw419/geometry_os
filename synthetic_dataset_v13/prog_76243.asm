; DESCRIPTION: Draws a cyan rectangle at (402, 50) with width 50 and height 103.
; PLAN: r0=402(x), r1=50(y), r2=50(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 50
LDI r2, 50
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
