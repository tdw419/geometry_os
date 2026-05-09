; DESCRIPTION: Places a cyan 31x68 rectangle at position (434, 80).
; PLAN: r0=434(x), r1=80(y), r2=31(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 80
LDI r2, 31
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
