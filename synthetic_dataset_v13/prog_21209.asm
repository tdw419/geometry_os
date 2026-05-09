; DESCRIPTION: Creates a magenta rectangular region at (410, 33) spanning 64 by 42 pixels.
; PLAN: r0=410(x), r1=33(y), r2=64(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 33
LDI r2, 64
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
