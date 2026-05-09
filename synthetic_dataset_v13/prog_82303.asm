; DESCRIPTION: Creates a yellow rectangular region at (42, 4) spanning 113 by 117 pixels.
; PLAN: r0=42(x), r1=4(y), r2=113(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 4
LDI r2, 113
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
