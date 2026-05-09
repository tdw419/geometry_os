; DESCRIPTION: Creates a cyan rectangular region at (42, 90) spanning 50 by 37 pixels.
; PLAN: r0=42(x), r1=90(y), r2=50(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 90
LDI r2, 50
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
