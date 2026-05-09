; DESCRIPTION: Creates a magenta rectangular region at (206, 195) spanning 117 by 19 pixels.
; PLAN: r0=206(x), r1=195(y), r2=117(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 195
LDI r2, 117
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
