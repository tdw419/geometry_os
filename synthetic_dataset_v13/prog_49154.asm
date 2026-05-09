; DESCRIPTION: Creates a red rectangular region at (130, 189) spanning 63 by 10 pixels.
; PLAN: r0=130(x), r1=189(y), r2=63(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 189
LDI r2, 63
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
