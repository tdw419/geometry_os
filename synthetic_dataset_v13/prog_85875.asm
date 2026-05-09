; DESCRIPTION: Creates a cyan rectangular region at (7, 50) spanning 76 by 96 pixels.
; PLAN: r0=7(x), r1=50(y), r2=76(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 50
LDI r2, 76
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
