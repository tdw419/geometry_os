; DESCRIPTION: Places a cyan 118x72 rectangle at position (288, 167).
; PLAN: r0=288(x), r1=167(y), r2=118(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 167
LDI r2, 118
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
