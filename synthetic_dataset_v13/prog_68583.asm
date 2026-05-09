; DESCRIPTION: Creates a orange rectangular region at (398, 148) spanning 67 by 44 pixels.
; PLAN: r0=398(x), r1=148(y), r2=67(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 148
LDI r2, 67
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
