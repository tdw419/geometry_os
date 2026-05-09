; DESCRIPTION: Creates a cyan rectangular region at (120, 37) spanning 13 by 68 pixels.
; PLAN: r0=120(x), r1=37(y), r2=13(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 37
LDI r2, 13
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
