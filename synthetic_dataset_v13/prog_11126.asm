; DESCRIPTION: Creates a cyan rectangular region at (342, 207) spanning 47 by 13 pixels.
; PLAN: r0=342(x), r1=207(y), r2=47(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 207
LDI r2, 47
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
