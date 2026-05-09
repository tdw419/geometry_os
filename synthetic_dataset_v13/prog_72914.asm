; DESCRIPTION: Places a red 112x18 rectangle at position (281, 15).
; PLAN: r0=281(x), r1=15(y), r2=112(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 15
LDI r2, 112
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
