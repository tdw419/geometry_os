; DESCRIPTION: Creates a cyan rectangular region at (91, 126) spanning 11 by 38 pixels.
; PLAN: r0=91(x), r1=126(y), r2=11(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 126
LDI r2, 11
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
