; DESCRIPTION: Renders a orange box of size 118x103 starting at (387, 99).
; PLAN: r0=387(x), r1=99(y), r2=118(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 99
LDI r2, 118
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
