; DESCRIPTION: Places a cyan 48x65 rectangle at position (207, 183).
; PLAN: r0=207(x), r1=183(y), r2=48(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 183
LDI r2, 48
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
