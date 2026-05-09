; DESCRIPTION: Creates a cyan rectangular region at (101, 31) spanning 49 by 120 pixels.
; PLAN: r0=101(x), r1=31(y), r2=49(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 31
LDI r2, 49
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
