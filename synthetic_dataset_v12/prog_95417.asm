; DESCRIPTION: Places a cyan 80x72 rectangle at position (21, 2).
; PLAN: r0=21(x), r1=2(y), r2=80(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 2
LDI r2, 80
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
