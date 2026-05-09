; DESCRIPTION: Creates a yellow rectangular region at (82, 61) spanning 69 by 42 pixels.
; PLAN: r0=82(x), r1=61(y), r2=69(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 61
LDI r2, 69
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
