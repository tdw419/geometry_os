; DESCRIPTION: Creates a cyan rectangular region at (405, 17) spanning 10 by 95 pixels.
; PLAN: r0=405(x), r1=17(y), r2=10(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 17
LDI r2, 10
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
