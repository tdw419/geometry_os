; DESCRIPTION: Creates a cyan rectangular region at (32, 76) spanning 120 by 90 pixels.
; PLAN: r0=32(x), r1=76(y), r2=120(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 76
LDI r2, 120
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
