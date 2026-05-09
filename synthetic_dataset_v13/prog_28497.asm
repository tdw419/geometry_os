; DESCRIPTION: Creates a yellow rectangular region at (13, 120) spanning 91 by 50 pixels.
; PLAN: r0=13(x), r1=120(y), r2=91(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 120
LDI r2, 91
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
