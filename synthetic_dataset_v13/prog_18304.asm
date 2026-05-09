; DESCRIPTION: Creates a magenta rectangular region at (154, 55) spanning 64 by 120 pixels.
; PLAN: r0=154(x), r1=55(y), r2=64(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 55
LDI r2, 64
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
