; DESCRIPTION: Creates a black rectangular region at (295, 223) spanning 23 by 24 pixels.
; PLAN: r0=295(x), r1=223(y), r2=23(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 223
LDI r2, 23
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
