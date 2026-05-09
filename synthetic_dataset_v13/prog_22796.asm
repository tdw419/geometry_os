; DESCRIPTION: Places a cyan 108x63 rectangle at position (0, 38).
; PLAN: r0=0(x), r1=38(y), r2=108(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 38
LDI r2, 108
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
