; DESCRIPTION: Places a cyan 54x34 rectangle at position (73, 0).
; PLAN: r0=73(x), r1=0(y), r2=54(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 0
LDI r2, 54
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
