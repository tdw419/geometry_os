; DESCRIPTION: Creates a cyan rectangular region at (344, 93) spanning 23 by 103 pixels.
; PLAN: r0=344(x), r1=93(y), r2=23(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 93
LDI r2, 23
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
