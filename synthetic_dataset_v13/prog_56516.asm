; DESCRIPTION: Places a cyan 90x113 rectangle at position (64, 36).
; PLAN: r0=64(x), r1=36(y), r2=90(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 36
LDI r2, 90
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
