; DESCRIPTION: Draws a orange rectangle at (242, 103) with width 65 and height 65.
; PLAN: r0=242(x), r1=103(y), r2=65(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 103
LDI r2, 65
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
