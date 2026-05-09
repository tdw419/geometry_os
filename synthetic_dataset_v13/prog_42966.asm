; DESCRIPTION: Places a cyan 76x21 rectangle at position (40, 91).
; PLAN: r0=40(x), r1=91(y), r2=76(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 91
LDI r2, 76
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
