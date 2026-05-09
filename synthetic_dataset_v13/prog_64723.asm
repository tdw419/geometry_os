; DESCRIPTION: Places a magenta 98x77 rectangle at position (397, 83).
; PLAN: r0=397(x), r1=83(y), r2=98(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 83
LDI r2, 98
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
