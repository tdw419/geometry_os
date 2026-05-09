; DESCRIPTION: Creates a yellow rectangular region at (143, 202) spanning 88 by 42 pixels.
; PLAN: r0=143(x), r1=202(y), r2=88(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 202
LDI r2, 88
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
