; DESCRIPTION: Creates a red rectangular region at (394, 194) spanning 91 by 49 pixels.
; PLAN: r0=394(x), r1=194(y), r2=91(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 194
LDI r2, 91
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
