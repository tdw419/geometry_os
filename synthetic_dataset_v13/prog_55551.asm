; DESCRIPTION: Places a cyan 72x22 rectangle at position (37, 192).
; PLAN: r0=37(x), r1=192(y), r2=72(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 192
LDI r2, 72
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
