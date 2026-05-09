; DESCRIPTION: Creates a cyan rectangular region at (280, 121) spanning 85 by 90 pixels.
; PLAN: r0=280(x), r1=121(y), r2=85(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 121
LDI r2, 85
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
