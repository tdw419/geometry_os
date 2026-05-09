; DESCRIPTION: Draws a orange rectangle at (346, 80) with width 61 and height 93.
; PLAN: r0=346(x), r1=80(y), r2=61(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 80
LDI r2, 61
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
