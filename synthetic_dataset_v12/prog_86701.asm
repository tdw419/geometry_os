; DESCRIPTION: Creates a cyan rectangular region at (58, 178) spanning 50 by 31 pixels.
; PLAN: r0=58(x), r1=178(y), r2=50(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 178
LDI r2, 50
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
