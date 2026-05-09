; DESCRIPTION: Renders a orange box of size 75x89 starting at (177, 45).
; PLAN: r0=177(x), r1=45(y), r2=75(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 45
LDI r2, 75
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
