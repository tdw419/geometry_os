; DESCRIPTION: Places a red 69x85 rectangle at position (190, 65).
; PLAN: r0=190(x), r1=65(y), r2=69(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 65
LDI r2, 69
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
