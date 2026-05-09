; DESCRIPTION: Creates a cyan rectangular region at (169, 11) spanning 13 by 120 pixels.
; PLAN: r0=169(x), r1=11(y), r2=13(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 11
LDI r2, 13
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
