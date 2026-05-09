; DESCRIPTION: Places a cyan 119x102 rectangle at position (372, 46).
; PLAN: r0=372(x), r1=46(y), r2=119(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 46
LDI r2, 119
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
