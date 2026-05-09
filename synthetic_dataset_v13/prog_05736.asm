; DESCRIPTION: Draws a orange rectangle at (333, 32) with width 103 and height 59.
; PLAN: r0=333(x), r1=32(y), r2=103(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 32
LDI r2, 103
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
