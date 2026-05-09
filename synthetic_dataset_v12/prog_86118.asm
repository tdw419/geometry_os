; DESCRIPTION: Creates a yellow rectangular region at (42, 121) spanning 55 by 65 pixels.
; PLAN: r0=42(x), r1=121(y), r2=55(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 121
LDI r2, 55
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
