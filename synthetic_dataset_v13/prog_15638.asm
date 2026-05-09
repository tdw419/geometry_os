; DESCRIPTION: Places a red 52x87 rectangle at position (242, 13).
; PLAN: r0=242(x), r1=13(y), r2=52(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 13
LDI r2, 52
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
