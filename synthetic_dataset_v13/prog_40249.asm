; DESCRIPTION: Creates a red rectangular region at (320, 154) spanning 78 by 92 pixels.
; PLAN: r0=320(x), r1=154(y), r2=78(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 154
LDI r2, 78
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
