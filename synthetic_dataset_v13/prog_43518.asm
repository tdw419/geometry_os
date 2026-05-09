; DESCRIPTION: Creates a yellow rectangular region at (102, 114) spanning 42 by 52 pixels.
; PLAN: r0=102(x), r1=114(y), r2=42(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 114
LDI r2, 42
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
