; DESCRIPTION: Creates a red rectangular region at (218, 11) spanning 87 by 111 pixels.
; PLAN: r0=218(x), r1=11(y), r2=87(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 11
LDI r2, 87
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
