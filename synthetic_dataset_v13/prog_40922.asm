; DESCRIPTION: Creates a orange rectangular region at (487, 154) spanning 13 by 91 pixels.
; PLAN: r0=487(x), r1=154(y), r2=13(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 154
LDI r2, 13
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
