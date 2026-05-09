; DESCRIPTION: Creates a orange rectangular region at (280, 166) spanning 21 by 80 pixels.
; PLAN: r0=280(x), r1=166(y), r2=21(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 166
LDI r2, 21
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
