; DESCRIPTION: Renders a orange box of size 17x23 starting at (59, 125).
; PLAN: r0=59(x), r1=125(y), r2=17(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 125
LDI r2, 17
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
