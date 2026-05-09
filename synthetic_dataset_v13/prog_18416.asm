; DESCRIPTION: Renders a orange box of size 70x25 starting at (196, 46).
; PLAN: r0=196(x), r1=46(y), r2=70(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 46
LDI r2, 70
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
