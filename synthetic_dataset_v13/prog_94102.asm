; DESCRIPTION: Creates a white rectangular region at (16, 125) spanning 94 by 45 pixels.
; PLAN: r0=16(x), r1=125(y), r2=94(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 125
LDI r2, 94
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
