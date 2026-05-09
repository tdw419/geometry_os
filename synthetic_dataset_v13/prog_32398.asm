; DESCRIPTION: Places a green 64x99 rectangle at position (172, 82).
; PLAN: r0=172(x), r1=82(y), r2=64(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 82
LDI r2, 64
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
