; DESCRIPTION: Places a cyan 31x91 rectangle at position (200, 14).
; PLAN: r0=200(x), r1=14(y), r2=31(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 14
LDI r2, 31
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
