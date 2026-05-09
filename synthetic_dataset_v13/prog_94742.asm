; DESCRIPTION: Creates a cyan rectangular region at (116, 146) spanning 15 by 103 pixels.
; PLAN: r0=116(x), r1=146(y), r2=15(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 146
LDI r2, 15
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
