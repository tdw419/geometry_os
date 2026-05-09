; DESCRIPTION: Places a cyan 70x100 rectangle at position (329, 27).
; PLAN: r0=329(x), r1=27(y), r2=70(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 27
LDI r2, 70
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
