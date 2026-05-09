; DESCRIPTION: Places a cyan 43x23 rectangle at position (220, 112).
; PLAN: r0=220(x), r1=112(y), r2=43(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 112
LDI r2, 43
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
