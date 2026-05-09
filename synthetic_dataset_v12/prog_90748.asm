; DESCRIPTION: Creates a cyan rectangular region at (434, 207) spanning 19 by 31 pixels.
; PLAN: r0=434(x), r1=207(y), r2=19(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 207
LDI r2, 19
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
