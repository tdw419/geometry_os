; DESCRIPTION: Creates a orange rectangular region at (307, 126) spanning 18 by 48 pixels.
; PLAN: r0=307(x), r1=126(y), r2=18(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 126
LDI r2, 18
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
