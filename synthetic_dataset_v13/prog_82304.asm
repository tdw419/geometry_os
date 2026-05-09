; DESCRIPTION: Places a magenta 27x49 rectangle at position (210, 60).
; PLAN: r0=210(x), r1=60(y), r2=27(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 60
LDI r2, 27
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
