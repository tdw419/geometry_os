; DESCRIPTION: Places a cyan 68x17 rectangle at position (420, 183).
; PLAN: r0=420(x), r1=183(y), r2=68(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 183
LDI r2, 68
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
