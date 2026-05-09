; DESCRIPTION: Creates a orange rectangular region at (154, 42) spanning 64 by 81 pixels.
; PLAN: r0=154(x), r1=42(y), r2=64(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 42
LDI r2, 64
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
