; DESCRIPTION: Places a red 55x50 rectangle at position (53, 94).
; PLAN: r0=53(x), r1=94(y), r2=55(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 94
LDI r2, 55
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
