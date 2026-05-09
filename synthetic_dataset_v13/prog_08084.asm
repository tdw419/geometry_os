; DESCRIPTION: Creates a cyan rectangular region at (146, 87) spanning 14 by 43 pixels.
; PLAN: r0=146(x), r1=87(y), r2=14(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 87
LDI r2, 14
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
