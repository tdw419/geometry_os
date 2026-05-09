; DESCRIPTION: Creates a red rectangular region at (102, 46) spanning 16 by 45 pixels.
; PLAN: r0=102(x), r1=46(y), r2=16(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 46
LDI r2, 16
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
