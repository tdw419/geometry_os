; DESCRIPTION: Creates a white rectangular region at (259, 94) spanning 103 by 59 pixels.
; PLAN: r0=259(x), r1=94(y), r2=103(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 94
LDI r2, 103
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
