; DESCRIPTION: Places a cyan 96x100 rectangle at position (181, 142).
; PLAN: r0=181(x), r1=142(y), r2=96(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 142
LDI r2, 96
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
