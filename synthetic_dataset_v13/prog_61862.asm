; DESCRIPTION: Places a cyan 112x18 rectangle at position (153, 126).
; PLAN: r0=153(x), r1=126(y), r2=112(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 126
LDI r2, 112
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
