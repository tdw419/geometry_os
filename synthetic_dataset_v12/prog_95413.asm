; DESCRIPTION: Places a green 45x107 rectangle at position (294, 144).
; PLAN: r0=294(x), r1=144(y), r2=45(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 144
LDI r2, 45
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
