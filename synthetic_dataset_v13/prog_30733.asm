; DESCRIPTION: Creates a red rectangular region at (223, 27) spanning 40 by 32 pixels.
; PLAN: r0=223(x), r1=27(y), r2=40(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 27
LDI r2, 40
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
