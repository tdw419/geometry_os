; DESCRIPTION: Places a green 23x64 rectangle at position (167, 37).
; PLAN: r0=167(x), r1=37(y), r2=23(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 37
LDI r2, 23
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
