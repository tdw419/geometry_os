; DESCRIPTION: Places a green 107x84 rectangle at position (305, 45).
; PLAN: r0=305(x), r1=45(y), r2=107(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 45
LDI r2, 107
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
