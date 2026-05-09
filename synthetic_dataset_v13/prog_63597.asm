; DESCRIPTION: Creates a red rectangular region at (203, 229) spanning 91 by 13 pixels.
; PLAN: r0=203(x), r1=229(y), r2=91(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 229
LDI r2, 91
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
