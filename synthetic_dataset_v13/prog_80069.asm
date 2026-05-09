; DESCRIPTION: Places a red 69x45 rectangle at position (300, 129).
; PLAN: r0=300(x), r1=129(y), r2=69(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 129
LDI r2, 69
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
