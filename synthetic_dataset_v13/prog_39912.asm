; DESCRIPTION: Places a magenta 17x73 rectangle at position (344, 150).
; PLAN: r0=344(x), r1=150(y), r2=17(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 150
LDI r2, 17
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
