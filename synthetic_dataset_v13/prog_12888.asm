; DESCRIPTION: Places a cyan 105x92 rectangle at position (86, 47).
; PLAN: r0=86(x), r1=47(y), r2=105(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 47
LDI r2, 105
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
