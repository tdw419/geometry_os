; DESCRIPTION: Creates a cyan rectangular region at (103, 65) spanning 95 by 103 pixels.
; PLAN: r0=103(x), r1=65(y), r2=95(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 65
LDI r2, 95
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
