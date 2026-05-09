; DESCRIPTION: Places a cyan 76x93 rectangle at position (166, 124).
; PLAN: r0=166(x), r1=124(y), r2=76(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 124
LDI r2, 76
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
