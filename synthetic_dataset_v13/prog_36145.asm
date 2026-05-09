; DESCRIPTION: Places a cyan 113x111 rectangle at position (299, 49).
; PLAN: r0=299(x), r1=49(y), r2=113(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 49
LDI r2, 113
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
