; DESCRIPTION: Creates a orange rectangular region at (398, 53) spanning 65 by 42 pixels.
; PLAN: r0=398(x), r1=53(y), r2=65(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 53
LDI r2, 65
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
