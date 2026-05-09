; DESCRIPTION: Creates a yellow rectangular region at (92, 86) spanning 42 by 116 pixels.
; PLAN: r0=92(x), r1=86(y), r2=42(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 86
LDI r2, 42
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
