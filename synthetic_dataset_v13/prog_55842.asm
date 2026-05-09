; DESCRIPTION: Renders a orange box of size 94x94 starting at (340, 89).
; PLAN: r0=340(x), r1=89(y), r2=94(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 89
LDI r2, 94
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
