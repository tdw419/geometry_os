; DESCRIPTION: Places a red 18x103 rectangle at position (116, 134).
; PLAN: r0=116(x), r1=134(y), r2=18(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 134
LDI r2, 18
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
