; DESCRIPTION: Places a cyan 81x68 rectangle at position (102, 27).
; PLAN: r0=102(x), r1=27(y), r2=81(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 27
LDI r2, 81
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
