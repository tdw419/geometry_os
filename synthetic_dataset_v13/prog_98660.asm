; DESCRIPTION: Creates a white rectangular region at (161, 2) spanning 59 by 42 pixels.
; PLAN: r0=161(x), r1=2(y), r2=59(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 2
LDI r2, 59
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
