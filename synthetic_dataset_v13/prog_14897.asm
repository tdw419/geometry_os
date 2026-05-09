; DESCRIPTION: Creates a magenta rectangular region at (243, 10) spanning 103 by 120 pixels.
; PLAN: r0=243(x), r1=10(y), r2=103(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 10
LDI r2, 103
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
