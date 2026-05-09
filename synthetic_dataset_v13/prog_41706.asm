; DESCRIPTION: Creates a cyan rectangular region at (66, 8) spanning 91 by 85 pixels.
; PLAN: r0=66(x), r1=8(y), r2=91(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 8
LDI r2, 91
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
