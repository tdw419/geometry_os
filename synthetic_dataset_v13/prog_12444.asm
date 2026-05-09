; DESCRIPTION: Places a cyan 106x64 rectangle at position (222, 149).
; PLAN: r0=222(x), r1=149(y), r2=106(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 149
LDI r2, 106
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
