; DESCRIPTION: Creates a yellow rectangular region at (208, 42) spanning 117 by 55 pixels.
; PLAN: r0=208(x), r1=42(y), r2=117(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 42
LDI r2, 117
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
