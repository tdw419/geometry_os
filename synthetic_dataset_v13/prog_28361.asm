; DESCRIPTION: Places a cyan 27x10 rectangle at position (452, 1).
; PLAN: r0=452(x), r1=1(y), r2=27(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 1
LDI r2, 27
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
