; DESCRIPTION: Creates a blue rectangular region at (445, 16) spanning 61 by 115 pixels.
; PLAN: r0=445(x), r1=16(y), r2=61(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 16
LDI r2, 61
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
