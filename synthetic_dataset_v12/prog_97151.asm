; DESCRIPTION: Renders a orange box of size 23x65 starting at (330, 125).
; PLAN: r0=330(x), r1=125(y), r2=23(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 125
LDI r2, 23
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
