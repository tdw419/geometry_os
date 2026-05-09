; DESCRIPTION: Creates a magenta rectangular region at (305, 126) spanning 30 by 82 pixels.
; PLAN: r0=305(x), r1=126(y), r2=30(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 126
LDI r2, 30
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
