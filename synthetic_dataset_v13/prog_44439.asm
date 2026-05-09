; DESCRIPTION: Creates a magenta rectangular region at (392, 191) spanning 115 by 42 pixels.
; PLAN: r0=392(x), r1=191(y), r2=115(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 191
LDI r2, 115
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
