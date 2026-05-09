; DESCRIPTION: Places a cyan 28x37 rectangle at position (175, 72).
; PLAN: r0=175(x), r1=72(y), r2=28(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 72
LDI r2, 28
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
