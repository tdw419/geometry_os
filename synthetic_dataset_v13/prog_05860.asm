; DESCRIPTION: Creates a cyan rectangular region at (59, 149) spanning 42 by 24 pixels.
; PLAN: r0=59(x), r1=149(y), r2=42(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 149
LDI r2, 42
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
