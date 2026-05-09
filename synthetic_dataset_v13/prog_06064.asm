; DESCRIPTION: Places a cyan 91x98 rectangle at position (256, 127).
; PLAN: r0=256(x), r1=127(y), r2=91(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 127
LDI r2, 91
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
