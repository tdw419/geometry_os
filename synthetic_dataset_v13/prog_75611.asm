; DESCRIPTION: Places a cyan 97x27 rectangle at position (120, 19).
; PLAN: r0=120(x), r1=19(y), r2=97(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 19
LDI r2, 97
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
