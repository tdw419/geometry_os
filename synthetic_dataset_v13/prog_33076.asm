; DESCRIPTION: Creates a cyan rectangular region at (151, 116) spanning 95 by 71 pixels.
; PLAN: r0=151(x), r1=116(y), r2=95(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 116
LDI r2, 95
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
