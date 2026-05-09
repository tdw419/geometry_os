; DESCRIPTION: Draws a orange rectangle at (242, 151) with width 55 and height 95.
; PLAN: r0=242(x), r1=151(y), r2=55(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 151
LDI r2, 55
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
