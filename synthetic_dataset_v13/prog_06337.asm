; DESCRIPTION: Places a cyan 36x119 rectangle at position (412, 57).
; PLAN: r0=412(x), r1=57(y), r2=36(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 57
LDI r2, 36
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
