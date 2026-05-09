; DESCRIPTION: Creates a cyan rectangular region at (206, 158) spanning 77 by 32 pixels.
; PLAN: r0=206(x), r1=158(y), r2=77(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 158
LDI r2, 77
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
