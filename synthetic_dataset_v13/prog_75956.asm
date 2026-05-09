; DESCRIPTION: Places a red 69x50 rectangle at position (17, 190).
; PLAN: r0=17(x), r1=190(y), r2=69(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 190
LDI r2, 69
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
