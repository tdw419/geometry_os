; DESCRIPTION: Creates a white rectangular region at (46, 86) spanning 86 by 27 pixels.
; PLAN: r0=46(x), r1=86(y), r2=86(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 86
LDI r2, 86
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
