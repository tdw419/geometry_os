; DESCRIPTION: Places a cyan 55x102 rectangle at position (248, 119).
; PLAN: r0=248(x), r1=119(y), r2=55(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 119
LDI r2, 55
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
