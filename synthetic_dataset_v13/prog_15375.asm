; DESCRIPTION: Places a cyan 14x87 rectangle at position (481, 134).
; PLAN: r0=481(x), r1=134(y), r2=14(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 134
LDI r2, 14
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
