; DESCRIPTION: Creates a cyan rectangular region at (316, 223) spanning 72 by 24 pixels.
; PLAN: r0=316(x), r1=223(y), r2=72(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 223
LDI r2, 72
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
