; DESCRIPTION: Creates a red rectangular region at (154, 126) spanning 81 by 64 pixels.
; PLAN: r0=154(x), r1=126(y), r2=81(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 126
LDI r2, 81
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
