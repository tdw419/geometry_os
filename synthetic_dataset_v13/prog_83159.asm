; DESCRIPTION: Places a yellow 98x30 rectangle at position (365, 28).
; PLAN: r0=365(x), r1=28(y), r2=98(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 28
LDI r2, 98
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
