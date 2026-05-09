; DESCRIPTION: Places a cyan 31x101 rectangle at position (213, 48).
; PLAN: r0=213(x), r1=48(y), r2=31(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 48
LDI r2, 31
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
