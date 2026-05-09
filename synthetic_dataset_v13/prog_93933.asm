; DESCRIPTION: Creates a red rectangular region at (108, 46) spanning 69 by 27 pixels.
; PLAN: r0=108(x), r1=46(y), r2=69(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 46
LDI r2, 69
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
