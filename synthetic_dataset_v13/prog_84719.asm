; DESCRIPTION: Creates a red rectangular region at (394, 56) spanning 98 by 56 pixels.
; PLAN: r0=394(x), r1=56(y), r2=98(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 56
LDI r2, 98
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
