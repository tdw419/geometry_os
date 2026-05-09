; DESCRIPTION: Places a red 53x53 rectangle at position (326, 44).
; PLAN: r0=326(x), r1=44(y), r2=53(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 44
LDI r2, 53
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
