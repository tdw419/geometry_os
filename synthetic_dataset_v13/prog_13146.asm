; DESCRIPTION: Creates a magenta rectangular region at (401, 69) spanning 51 by 50 pixels.
; PLAN: r0=401(x), r1=69(y), r2=51(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 69
LDI r2, 51
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
