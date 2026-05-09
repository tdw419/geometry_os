; DESCRIPTION: Places a cyan 98x21 rectangle at position (142, 134).
; PLAN: r0=142(x), r1=134(y), r2=98(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 134
LDI r2, 98
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
