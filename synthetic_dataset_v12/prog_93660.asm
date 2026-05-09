; DESCRIPTION: Places a red 28x42 rectangle at position (314, 27).
; PLAN: r0=314(x), r1=27(y), r2=28(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 27
LDI r2, 28
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
