; DESCRIPTION: Creates a cyan rectangular region at (439, 59) spanning 70 by 115 pixels.
; PLAN: r0=439(x), r1=59(y), r2=70(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 59
LDI r2, 70
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
