; DESCRIPTION: Places a cyan 96x10 rectangle at position (394, 104).
; PLAN: r0=394(x), r1=104(y), r2=96(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 104
LDI r2, 96
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
