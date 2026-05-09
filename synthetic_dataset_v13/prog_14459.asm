; DESCRIPTION: Places a magenta 96x120 rectangle at position (405, 133).
; PLAN: r0=405(x), r1=133(y), r2=96(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 133
LDI r2, 96
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
