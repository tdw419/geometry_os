; DESCRIPTION: Places a cyan 16x58 rectangle at position (245, 15).
; PLAN: r0=245(x), r1=15(y), r2=16(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 15
LDI r2, 16
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
