; DESCRIPTION: Creates a orange rectangular region at (392, 5) spanning 33 by 74 pixels.
; PLAN: r0=392(x), r1=5(y), r2=33(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 5
LDI r2, 33
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
