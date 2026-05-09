; DESCRIPTION: Renders a orange box of size 115x56 starting at (193, 21).
; PLAN: r0=193(x), r1=21(y), r2=115(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 21
LDI r2, 115
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
