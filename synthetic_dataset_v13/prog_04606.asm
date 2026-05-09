; DESCRIPTION: Places a magenta 12x77 rectangle at position (271, 172).
; PLAN: r0=271(x), r1=172(y), r2=12(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 172
LDI r2, 12
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
