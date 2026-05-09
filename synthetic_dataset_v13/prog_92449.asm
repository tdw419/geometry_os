; DESCRIPTION: Creates a green rectangular region at (429, 94) spanning 10 by 70 pixels.
; PLAN: r0=429(x), r1=94(y), r2=10(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 94
LDI r2, 10
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
