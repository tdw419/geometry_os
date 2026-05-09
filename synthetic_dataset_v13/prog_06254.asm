; DESCRIPTION: Places a cyan 34x109 rectangle at position (291, 93).
; PLAN: r0=291(x), r1=93(y), r2=34(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 93
LDI r2, 34
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
