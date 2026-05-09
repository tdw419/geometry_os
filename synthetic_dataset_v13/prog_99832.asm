; DESCRIPTION: Creates a orange rectangular region at (437, 153) spanning 64 by 42 pixels.
; PLAN: r0=437(x), r1=153(y), r2=64(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 153
LDI r2, 64
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
