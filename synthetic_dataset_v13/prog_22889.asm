; DESCRIPTION: Creates a cyan rectangular region at (26, 42) spanning 95 by 48 pixels.
; PLAN: r0=26(x), r1=42(y), r2=95(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 42
LDI r2, 95
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
