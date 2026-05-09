; DESCRIPTION: Creates a cyan rectangular region at (301, 26) spanning 52 by 50 pixels.
; PLAN: r0=301(x), r1=26(y), r2=52(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 26
LDI r2, 52
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
