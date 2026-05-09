; DESCRIPTION: Creates a red rectangular region at (139, 64) spanning 42 by 109 pixels.
; PLAN: r0=139(x), r1=64(y), r2=42(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 64
LDI r2, 42
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
