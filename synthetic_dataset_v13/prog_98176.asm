; DESCRIPTION: Places a cyan 71x39 rectangle at position (93, 7).
; PLAN: r0=93(x), r1=7(y), r2=71(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 7
LDI r2, 71
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
