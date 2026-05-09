; DESCRIPTION: Creates a black rectangular region at (189, 228) spanning 116 by 18 pixels.
; PLAN: r0=189(x), r1=228(y), r2=116(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 228
LDI r2, 116
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
