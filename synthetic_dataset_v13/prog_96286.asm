; DESCRIPTION: Places a red 55x14 rectangle at position (246, 50).
; PLAN: r0=246(x), r1=50(y), r2=55(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 50
LDI r2, 55
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
