; DESCRIPTION: Creates a red rectangular region at (97, 214) spanning 102 by 42 pixels.
; PLAN: r0=97(x), r1=214(y), r2=102(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 214
LDI r2, 102
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
