; DESCRIPTION: Creates a magenta rectangular region at (281, 70) spanning 50 by 103 pixels.
; PLAN: r0=281(x), r1=70(y), r2=50(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 70
LDI r2, 50
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
