; DESCRIPTION: Places a cyan 99x61 rectangle at position (9, 195).
; PLAN: r0=9(x), r1=195(y), r2=99(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 195
LDI r2, 99
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
