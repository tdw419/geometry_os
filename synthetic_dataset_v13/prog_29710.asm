; DESCRIPTION: Places a blue 107x48 rectangle at position (154, 159).
; PLAN: r0=154(x), r1=159(y), r2=107(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 159
LDI r2, 107
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
