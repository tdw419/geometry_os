; DESCRIPTION: Places a cyan 109x98 rectangle at position (212, 130).
; PLAN: r0=212(x), r1=130(y), r2=109(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 130
LDI r2, 109
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
