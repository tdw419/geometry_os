; DESCRIPTION: Creates a magenta rectangular region at (405, 159) spanning 105 by 51 pixels.
; PLAN: r0=405(x), r1=159(y), r2=105(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 159
LDI r2, 105
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
