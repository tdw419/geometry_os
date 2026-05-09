; DESCRIPTION: Creates a cyan rectangular region at (300, 37) spanning 60 by 42 pixels.
; PLAN: r0=300(x), r1=37(y), r2=60(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 37
LDI r2, 60
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
