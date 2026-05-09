; DESCRIPTION: Creates a cyan rectangular region at (60, 55) spanning 47 by 74 pixels.
; PLAN: r0=60(x), r1=55(y), r2=47(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 55
LDI r2, 47
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
