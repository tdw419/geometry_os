; DESCRIPTION: Places a cyan 46x83 rectangle at position (305, 84).
; PLAN: r0=305(x), r1=84(y), r2=46(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 84
LDI r2, 46
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
