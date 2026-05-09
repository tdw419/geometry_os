; DESCRIPTION: Places a cyan 93x27 rectangle at position (72, 76).
; PLAN: r0=72(x), r1=76(y), r2=93(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 76
LDI r2, 93
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
