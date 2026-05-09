; DESCRIPTION: Creates a magenta rectangular region at (271, 174) spanning 50 by 12 pixels.
; PLAN: r0=271(x), r1=174(y), r2=50(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 174
LDI r2, 50
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
