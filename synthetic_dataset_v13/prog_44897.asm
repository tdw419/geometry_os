; DESCRIPTION: Renders a orange box of size 40x74 starting at (84, 160).
; PLAN: r0=84(x), r1=160(y), r2=40(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 160
LDI r2, 40
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
