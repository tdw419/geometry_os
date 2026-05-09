; DESCRIPTION: Creates a cyan rectangular region at (50, 110) spanning 69 by 54 pixels.
; PLAN: r0=50(x), r1=110(y), r2=69(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 110
LDI r2, 69
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
