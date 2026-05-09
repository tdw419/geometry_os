; DESCRIPTION: Places a cyan 115x34 rectangle at position (242, 137).
; PLAN: r0=242(x), r1=137(y), r2=115(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 137
LDI r2, 115
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
