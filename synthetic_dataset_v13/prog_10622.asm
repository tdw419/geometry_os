; DESCRIPTION: Creates a red rectangular region at (145, 42) spanning 102 by 58 pixels.
; PLAN: r0=145(x), r1=42(y), r2=102(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 42
LDI r2, 102
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
