; DESCRIPTION: Places a cyan 95x71 rectangle at position (312, 167).
; PLAN: r0=312(x), r1=167(y), r2=95(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 167
LDI r2, 95
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
