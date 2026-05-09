; DESCRIPTION: Creates a orange rectangular region at (235, 168) spanning 100 by 18 pixels.
; PLAN: r0=235(x), r1=168(y), r2=100(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 168
LDI r2, 100
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
