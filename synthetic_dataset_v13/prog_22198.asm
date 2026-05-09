; DESCRIPTION: Places a cyan 75x71 rectangle at position (178, 4).
; PLAN: r0=178(x), r1=4(y), r2=75(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 4
LDI r2, 75
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
