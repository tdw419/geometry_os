; DESCRIPTION: Creates a red rectangular region at (91, 116) spanning 32 by 86 pixels.
; PLAN: r0=91(x), r1=116(y), r2=32(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 116
LDI r2, 32
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
