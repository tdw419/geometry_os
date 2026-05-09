; DESCRIPTION: Places a cyan 31x76 rectangle at position (208, 149).
; PLAN: r0=208(x), r1=149(y), r2=31(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 149
LDI r2, 31
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
