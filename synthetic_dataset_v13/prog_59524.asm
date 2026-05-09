; DESCRIPTION: Creates a orange rectangular region at (169, 150) spanning 16 by 69 pixels.
; PLAN: r0=169(x), r1=150(y), r2=16(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 150
LDI r2, 16
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
