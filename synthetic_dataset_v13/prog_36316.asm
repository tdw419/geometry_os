; DESCRIPTION: Places a magenta 28x27 rectangle at position (397, 186).
; PLAN: r0=397(x), r1=186(y), r2=28(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 186
LDI r2, 28
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
