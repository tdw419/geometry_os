; DESCRIPTION: Places a cyan 60x102 rectangle at position (271, 91).
; PLAN: r0=271(x), r1=91(y), r2=60(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 91
LDI r2, 60
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
