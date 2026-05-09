; DESCRIPTION: Places a purple 42x108 rectangle at position (404, 138).
; PLAN: r0=404(x), r1=138(y), r2=42(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 138
LDI r2, 42
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
