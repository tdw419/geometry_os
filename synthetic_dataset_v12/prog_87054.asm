; DESCRIPTION: Places a cyan 107x93 rectangle at position (334, 39).
; PLAN: r0=334(x), r1=39(y), r2=107(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 39
LDI r2, 107
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
