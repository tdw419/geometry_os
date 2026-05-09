; DESCRIPTION: Creates a cyan rectangular region at (0, 160) spanning 16 by 90 pixels.
; PLAN: r0=0(x), r1=160(y), r2=16(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 160
LDI r2, 16
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
