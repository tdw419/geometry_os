; DESCRIPTION: Creates a cyan rectangular region at (262, 40) spanning 26 by 42 pixels.
; PLAN: r0=262(x), r1=40(y), r2=26(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 40
LDI r2, 26
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
