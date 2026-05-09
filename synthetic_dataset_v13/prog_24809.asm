; DESCRIPTION: Places a red 40x42 rectangle at position (116, 199).
; PLAN: r0=116(x), r1=199(y), r2=40(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 199
LDI r2, 40
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
