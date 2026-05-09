; DESCRIPTION: Draws a orange rectangle at (280, 120) with width 64 and height 50.
; PLAN: r0=280(x), r1=120(y), r2=64(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 120
LDI r2, 64
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
