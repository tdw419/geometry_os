; DESCRIPTION: Creates a orange rectangular region at (70, 103) spanning 54 by 117 pixels.
; PLAN: r0=70(x), r1=103(y), r2=54(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 103
LDI r2, 54
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
