; DESCRIPTION: Creates a cyan rectangular region at (206, 8) spanning 10 by 19 pixels.
; PLAN: r0=206(x), r1=8(y), r2=10(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 8
LDI r2, 10
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
