; DESCRIPTION: Places a green 33x50 rectangle at position (397, 95).
; PLAN: r0=397(x), r1=95(y), r2=33(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 95
LDI r2, 33
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
