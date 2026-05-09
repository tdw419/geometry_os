; DESCRIPTION: Creates a white rectangular region at (187, 175) spanning 94 by 50 pixels.
; PLAN: r0=187(x), r1=175(y), r2=94(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 175
LDI r2, 94
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
