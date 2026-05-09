; DESCRIPTION: Places a cyan 24x53 rectangle at position (30, 48).
; PLAN: r0=30(x), r1=48(y), r2=24(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 48
LDI r2, 24
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
