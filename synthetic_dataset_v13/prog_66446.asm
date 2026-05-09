; DESCRIPTION: Places a green 107x48 rectangle at position (5, 141).
; PLAN: r0=5(x), r1=141(y), r2=107(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 141
LDI r2, 107
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
