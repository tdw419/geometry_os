; DESCRIPTION: Creates a cyan rectangular region at (161, 173) spanning 64 by 75 pixels.
; PLAN: r0=161(x), r1=173(y), r2=64(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 173
LDI r2, 64
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
