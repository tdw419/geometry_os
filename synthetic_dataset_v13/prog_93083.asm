; DESCRIPTION: Creates a white rectangular region at (168, 4) spanning 59 by 28 pixels.
; PLAN: r0=168(x), r1=4(y), r2=59(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 4
LDI r2, 59
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
