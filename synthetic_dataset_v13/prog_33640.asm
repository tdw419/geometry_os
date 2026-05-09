; DESCRIPTION: Places a cyan 84x32 rectangle at position (305, 114).
; PLAN: r0=305(x), r1=114(y), r2=84(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 114
LDI r2, 84
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
