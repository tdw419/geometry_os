; DESCRIPTION: Places a cyan 53x60 rectangle at position (210, 91).
; PLAN: r0=210(x), r1=91(y), r2=53(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 91
LDI r2, 53
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
