; DESCRIPTION: Places a cyan 65x55 rectangle at position (356, 58).
; PLAN: r0=356(x), r1=58(y), r2=65(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 58
LDI r2, 65
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
