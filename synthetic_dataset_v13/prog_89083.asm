; DESCRIPTION: Creates a cyan rectangular region at (187, 50) spanning 64 by 29 pixels.
; PLAN: r0=187(x), r1=50(y), r2=64(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 50
LDI r2, 64
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
