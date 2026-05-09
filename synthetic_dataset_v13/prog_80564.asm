; DESCRIPTION: Places a cyan 51x38 rectangle at position (338, 10).
; PLAN: r0=338(x), r1=10(y), r2=51(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 10
LDI r2, 51
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
