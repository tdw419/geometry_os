; DESCRIPTION: Creates a orange rectangular region at (75, 121) spanning 113 by 120 pixels.
; PLAN: r0=75(x), r1=121(y), r2=113(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 121
LDI r2, 113
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
