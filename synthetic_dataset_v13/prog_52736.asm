; DESCRIPTION: Draws a orange rectangle at (368, 149) with width 109 and height 86.
; PLAN: r0=368(x), r1=149(y), r2=109(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 149
LDI r2, 109
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
