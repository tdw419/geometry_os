; DESCRIPTION: Creates a cyan rectangular region at (316, 162) spanning 42 by 19 pixels.
; PLAN: r0=316(x), r1=162(y), r2=42(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 162
LDI r2, 42
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
