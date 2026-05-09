; DESCRIPTION: Creates a cyan rectangular region at (16, 185) spanning 50 by 11 pixels.
; PLAN: r0=16(x), r1=185(y), r2=50(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 185
LDI r2, 50
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
