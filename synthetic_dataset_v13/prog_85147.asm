; DESCRIPTION: Places a cyan 48x30 rectangle at position (407, 197).
; PLAN: r0=407(x), r1=197(y), r2=48(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 197
LDI r2, 48
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
