; DESCRIPTION: Creates a magenta rectangular region at (87, 126) spanning 107 by 105 pixels.
; PLAN: r0=87(x), r1=126(y), r2=107(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 126
LDI r2, 107
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
