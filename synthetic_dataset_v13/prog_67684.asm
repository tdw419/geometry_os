; DESCRIPTION: Creates a cyan rectangular region at (123, 135) spanning 90 by 91 pixels.
; PLAN: r0=123(x), r1=135(y), r2=90(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 135
LDI r2, 90
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
