; DESCRIPTION: Creates a cyan rectangular region at (39, 42) spanning 55 by 116 pixels.
; PLAN: r0=39(x), r1=42(y), r2=55(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 42
LDI r2, 55
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
