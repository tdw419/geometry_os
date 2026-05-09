; DESCRIPTION: Creates a white rectangular region at (10, 127) spanning 16 by 109 pixels.
; PLAN: r0=10(x), r1=127(y), r2=16(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 127
LDI r2, 16
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
