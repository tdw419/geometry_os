; DESCRIPTION: Creates a green rectangular region at (293, 117) spanning 61 by 91 pixels.
; PLAN: r0=293(x), r1=117(y), r2=61(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 117
LDI r2, 61
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
