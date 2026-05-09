; DESCRIPTION: Renders a orange box of size 47x115 starting at (120, 99).
; PLAN: r0=120(x), r1=99(y), r2=47(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 99
LDI r2, 47
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
