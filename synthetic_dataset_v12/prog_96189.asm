; DESCRIPTION: Creates a cyan rectangular region at (31, 168) spanning 103 by 31 pixels.
; PLAN: r0=31(x), r1=168(y), r2=103(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 168
LDI r2, 103
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
