; DESCRIPTION: Places a cyan 22x30 rectangle at position (317, 112).
; PLAN: r0=317(x), r1=112(y), r2=22(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 112
LDI r2, 22
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
