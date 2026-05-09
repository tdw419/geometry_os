; DESCRIPTION: Creates a cyan rectangular region at (313, 126) spanning 42 by 87 pixels.
; PLAN: r0=313(x), r1=126(y), r2=42(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 126
LDI r2, 42
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
