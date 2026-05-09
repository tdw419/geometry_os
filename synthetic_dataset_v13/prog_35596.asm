; DESCRIPTION: Places a cyan 119x60 rectangle at position (209, 92).
; PLAN: r0=209(x), r1=92(y), r2=119(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 92
LDI r2, 119
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
