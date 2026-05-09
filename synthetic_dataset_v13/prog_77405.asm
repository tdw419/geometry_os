; DESCRIPTION: Places a green 113x96 rectangle at position (164, 73).
; PLAN: r0=164(x), r1=73(y), r2=113(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 73
LDI r2, 113
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
