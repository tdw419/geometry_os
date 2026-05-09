; DESCRIPTION: Places a green 102x70 rectangle at position (18, 14).
; PLAN: r0=18(x), r1=14(y), r2=102(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 14
LDI r2, 102
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
