; DESCRIPTION: Creates a purple rectangular region at (434, 117) spanning 38 by 113 pixels.
; PLAN: r0=434(x), r1=117(y), r2=38(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 117
LDI r2, 38
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
