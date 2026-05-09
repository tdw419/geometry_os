; DESCRIPTION: Renders a orange box of size 94x74 starting at (349, 138).
; PLAN: r0=349(x), r1=138(y), r2=94(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 138
LDI r2, 94
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
