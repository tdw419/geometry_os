; DESCRIPTION: Creates a cyan rectangular region at (442, 96) spanning 20 by 117 pixels.
; PLAN: r0=442(x), r1=96(y), r2=20(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 96
LDI r2, 20
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
