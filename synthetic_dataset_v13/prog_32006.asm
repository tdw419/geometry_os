; DESCRIPTION: Creates a cyan rectangular region at (280, 236) spanning 101 by 10 pixels.
; PLAN: r0=280(x), r1=236(y), r2=101(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 236
LDI r2, 101
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
