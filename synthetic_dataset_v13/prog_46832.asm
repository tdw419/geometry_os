; DESCRIPTION: Places a cyan 36x27 rectangle at position (102, 6).
; PLAN: r0=102(x), r1=6(y), r2=36(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 6
LDI r2, 36
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
