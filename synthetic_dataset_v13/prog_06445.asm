; DESCRIPTION: Creates a cyan rectangular region at (342, 42) spanning 70 by 20 pixels.
; PLAN: r0=342(x), r1=42(y), r2=70(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 42
LDI r2, 70
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
