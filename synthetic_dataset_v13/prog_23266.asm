; DESCRIPTION: Creates a white rectangular region at (146, 134) spanning 11 by 86 pixels.
; PLAN: r0=146(x), r1=134(y), r2=11(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 134
LDI r2, 11
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
