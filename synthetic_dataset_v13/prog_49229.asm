; DESCRIPTION: Creates a orange rectangular region at (277, 150) spanning 67 by 95 pixels.
; PLAN: r0=277(x), r1=150(y), r2=67(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 150
LDI r2, 67
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
