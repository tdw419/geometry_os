; DESCRIPTION: Places a cyan 120x99 rectangle at position (1, 0).
; PLAN: r0=1(x), r1=0(y), r2=120(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 0
LDI r2, 120
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
