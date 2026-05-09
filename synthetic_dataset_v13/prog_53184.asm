; DESCRIPTION: Creates a orange rectangular region at (288, 186) spanning 70 by 69 pixels.
; PLAN: r0=288(x), r1=186(y), r2=70(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 186
LDI r2, 70
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
