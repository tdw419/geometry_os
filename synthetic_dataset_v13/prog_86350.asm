; DESCRIPTION: Places a green 98x29 rectangle at position (413, 134).
; PLAN: r0=413(x), r1=134(y), r2=98(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 134
LDI r2, 98
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
