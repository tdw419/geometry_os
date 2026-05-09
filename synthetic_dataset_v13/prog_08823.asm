; DESCRIPTION: Creates a cyan rectangular region at (248, 96) spanning 72 by 50 pixels.
; PLAN: r0=248(x), r1=96(y), r2=72(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 96
LDI r2, 72
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
