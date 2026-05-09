; DESCRIPTION: Creates a cyan rectangular region at (66, 163) spanning 91 by 42 pixels.
; PLAN: r0=66(x), r1=163(y), r2=91(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 163
LDI r2, 91
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
