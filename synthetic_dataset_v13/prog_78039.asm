; DESCRIPTION: Creates a cyan rectangular region at (342, 75) spanning 87 by 38 pixels.
; PLAN: r0=342(x), r1=75(y), r2=87(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 75
LDI r2, 87
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
