; DESCRIPTION: Renders a orange box of size 94x18 starting at (39, 89).
; PLAN: r0=39(x), r1=89(y), r2=94(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 89
LDI r2, 94
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
