; DESCRIPTION: Creates a cyan rectangular region at (203, 225) spanning 50 by 26 pixels.
; PLAN: r0=203(x), r1=225(y), r2=50(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 225
LDI r2, 50
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
