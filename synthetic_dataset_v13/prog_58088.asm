; DESCRIPTION: Places a magenta 58x46 rectangle at position (200, 186).
; PLAN: r0=200(x), r1=186(y), r2=58(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 186
LDI r2, 58
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
