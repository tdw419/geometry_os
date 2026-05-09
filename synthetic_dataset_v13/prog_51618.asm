; DESCRIPTION: Places a cyan 40x81 rectangle at position (145, 27).
; PLAN: r0=145(x), r1=27(y), r2=40(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 27
LDI r2, 40
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
