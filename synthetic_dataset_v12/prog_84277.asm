; DESCRIPTION: Creates a yellow rectangular region at (229, 82) spanning 42 by 108 pixels.
; PLAN: r0=229(x), r1=82(y), r2=42(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 82
LDI r2, 42
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
