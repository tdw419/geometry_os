; DESCRIPTION: Places a green 99x53 rectangle at position (397, 143).
; PLAN: r0=397(x), r1=143(y), r2=99(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 143
LDI r2, 99
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
