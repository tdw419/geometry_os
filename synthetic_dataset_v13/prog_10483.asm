; DESCRIPTION: Places a cyan 63x67 rectangle at position (423, 134).
; PLAN: r0=423(x), r1=134(y), r2=63(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 134
LDI r2, 63
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
