; DESCRIPTION: Creates a cyan rectangular region at (144, 54) spanning 42 by 120 pixels.
; PLAN: r0=144(x), r1=54(y), r2=42(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 54
LDI r2, 42
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
