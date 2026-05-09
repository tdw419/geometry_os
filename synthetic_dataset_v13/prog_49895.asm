; DESCRIPTION: Places a cyan 55x119 rectangle at position (337, 24).
; PLAN: r0=337(x), r1=24(y), r2=55(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 24
LDI r2, 55
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
