; DESCRIPTION: Creates a cyan rectangular region at (254, 185) spanning 10 by 27 pixels.
; PLAN: r0=254(x), r1=185(y), r2=10(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 185
LDI r2, 10
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
