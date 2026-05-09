; DESCRIPTION: Renders a orange box of size 60x17 starting at (225, 57).
; PLAN: r0=225(x), r1=57(y), r2=60(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 57
LDI r2, 60
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
