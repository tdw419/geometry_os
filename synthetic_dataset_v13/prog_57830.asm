; DESCRIPTION: Creates a cyan rectangular region at (67, 95) spanning 60 by 64 pixels.
; PLAN: r0=67(x), r1=95(y), r2=60(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 95
LDI r2, 60
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
