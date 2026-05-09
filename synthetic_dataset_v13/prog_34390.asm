; DESCRIPTION: Places a cyan 78x27 rectangle at position (182, 18).
; PLAN: r0=182(x), r1=18(y), r2=78(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 18
LDI r2, 78
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
