; DESCRIPTION: Creates a cyan rectangular region at (88, 48) spanning 120 by 14 pixels.
; PLAN: r0=88(x), r1=48(y), r2=120(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 48
LDI r2, 120
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
