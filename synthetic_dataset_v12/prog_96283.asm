; DESCRIPTION: Places a cyan 64x19 rectangle at position (121, 134).
; PLAN: r0=121(x), r1=134(y), r2=64(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 134
LDI r2, 64
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
