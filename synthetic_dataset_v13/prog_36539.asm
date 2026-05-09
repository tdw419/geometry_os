; DESCRIPTION: Creates a cyan rectangular region at (25, 15) spanning 72 by 120 pixels.
; PLAN: r0=25(x), r1=15(y), r2=72(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 15
LDI r2, 72
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
