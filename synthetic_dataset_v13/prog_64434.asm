; DESCRIPTION: Creates a orange rectangular region at (346, 168) spanning 59 by 50 pixels.
; PLAN: r0=346(x), r1=168(y), r2=59(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 168
LDI r2, 59
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
