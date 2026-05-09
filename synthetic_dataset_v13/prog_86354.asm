; DESCRIPTION: Draws a blue rectangle at (373, 228) with width 50 and height 14.
; PLAN: r0=373(x), r1=228(y), r2=50(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 228
LDI r2, 50
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
