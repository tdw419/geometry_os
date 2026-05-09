; DESCRIPTION: Places a cyan 74x19 rectangle at position (423, 120).
; PLAN: r0=423(x), r1=120(y), r2=74(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 120
LDI r2, 74
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
