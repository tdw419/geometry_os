; DESCRIPTION: Places a green 44x24 rectangle at position (154, 191).
; PLAN: r0=154(x), r1=191(y), r2=44(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 191
LDI r2, 44
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
