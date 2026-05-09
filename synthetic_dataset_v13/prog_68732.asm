; DESCRIPTION: Places a cyan 15x34 rectangle at position (71, 60).
; PLAN: r0=71(x), r1=60(y), r2=15(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 60
LDI r2, 15
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
