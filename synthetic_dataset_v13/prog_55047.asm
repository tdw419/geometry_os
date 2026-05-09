; DESCRIPTION: Creates a cyan rectangular region at (315, 69) spanning 61 by 16 pixels.
; PLAN: r0=315(x), r1=69(y), r2=61(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 69
LDI r2, 61
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
