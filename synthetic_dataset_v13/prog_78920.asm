; DESCRIPTION: Creates a white rectangular region at (196, 63) spanning 107 by 91 pixels.
; PLAN: r0=196(x), r1=63(y), r2=107(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 63
LDI r2, 107
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
