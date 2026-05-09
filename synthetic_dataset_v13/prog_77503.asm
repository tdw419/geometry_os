; DESCRIPTION: Places a cyan 22x76 rectangle at position (440, 82).
; PLAN: r0=440(x), r1=82(y), r2=22(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 82
LDI r2, 22
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
