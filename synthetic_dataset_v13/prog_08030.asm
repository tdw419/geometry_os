; DESCRIPTION: Places a cyan 117x50 rectangle at position (153, 192).
; PLAN: r0=153(x), r1=192(y), r2=117(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 192
LDI r2, 117
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
