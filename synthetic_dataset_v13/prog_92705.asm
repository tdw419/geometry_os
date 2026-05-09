; DESCRIPTION: Creates a cyan rectangular region at (245, 159) spanning 79 by 91 pixels.
; PLAN: r0=245(x), r1=159(y), r2=79(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 159
LDI r2, 79
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
