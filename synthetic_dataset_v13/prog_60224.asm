; DESCRIPTION: Creates a white rectangular region at (387, 161) spanning 20 by 59 pixels.
; PLAN: r0=387(x), r1=161(y), r2=20(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 161
LDI r2, 20
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
