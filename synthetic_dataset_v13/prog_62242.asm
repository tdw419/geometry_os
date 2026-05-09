; DESCRIPTION: Creates a red rectangular region at (73, 126) spanning 59 by 31 pixels.
; PLAN: r0=73(x), r1=126(y), r2=59(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 126
LDI r2, 59
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
