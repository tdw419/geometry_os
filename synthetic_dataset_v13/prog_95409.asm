; DESCRIPTION: Creates a yellow rectangular region at (281, 79) spanning 70 by 60 pixels.
; PLAN: r0=281(x), r1=79(y), r2=70(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 79
LDI r2, 70
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
