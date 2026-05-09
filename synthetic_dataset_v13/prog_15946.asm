; DESCRIPTION: Renders a orange box of size 118x84 starting at (151, 146).
; PLAN: r0=151(x), r1=146(y), r2=118(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 146
LDI r2, 118
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
